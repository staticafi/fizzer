#include <composer/program_info.hpp>
#include <composer/program_options.hpp>
#include <utility/config.hpp>
#if COMPILER() == COMPILER_VC()
#    pragma warning(push)
#    pragma warning(disable : 4624 4996 4146 4800 4996 4005 4355 4244 4267)
#endif
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/DebugInfo.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Linker/Linker.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/DebugInfo/DIContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_os_ostream.h>
#if COMPILER() == COMPILER_VC()
#    pragma warning(pop)
#endif
#include <utility/timeprof.hpp>
#include <filesystem>
#include <memory>
#include <unordered_set>
#include <unordered_map>
#include <vector>
#include <string>
#include <iostream>
#include <fstream>


static std::string const  FIZZER_MODEL_PREFIX = "__fizzer_model__";
static std::string const  FIZZER_METHOD_UNDER_TEST = "__fizzer_method_under_test__";


static std::vector<llvm::Function*>  get_defined_fizzer_functions(llvm::Module&  M)
{
    std::vector<llvm::Function*>  defs;
    for (auto &F : M)
        if (!F.isDeclaration() && F.getName().starts_with(FIZZER_MODEL_PREFIX))
            defs.push_back(&F);
    return defs;
}


static std::vector<llvm::Function*>  get_declared_functions(llvm::Module&  M)
{
    std::vector<llvm::Function*>  decls;
    for (auto &F : M)
        if (F.isDeclaration() && !F.isIntrinsic() && !F.use_empty())
            decls.push_back(&F);
    return decls;
}


static std::string  get_or_build_model_file(std::string const&  data_root_dir, std::string const&  out_dir, bool const  m32)
{
    std::filesystem::path const  out_file{ data_root_dir + "/models/ll/models" + (m32 ? "_m32" : "") + ".ll" };
    if (std::filesystem::is_regular_file(out_file))
        return out_file.string();
    std::filesystem::create_directories(out_file.parent_path());

    llvm::SMDiagnostic D;
    llvm::LLVMContext C;
    std::unique_ptr<llvm::Module> M;
    std::unique_ptr<llvm::Linker> L;

    for (auto const&  entry : std::filesystem::recursive_directory_iterator(data_root_dir + "/models/c/"))
    {
        if (!entry.is_regular_file())
            continue;

        if (entry.path().extension() == ".c")
        {
            std::filesystem::path cfile = entry.path();
            
            // Make output .ll file path (mirror directory structure)
            std::filesystem::path relative = std::filesystem::relative(cfile, data_root_dir);
            std::filesystem::path llfile = out_dir / relative;
            llfile.replace_extension(".ll");
            std::filesystem::create_directories(llfile.parent_path());

            std::string const  cmd {
                "clang -O0 -g -S -emit-llvm -Wno-everything -fbracket-depth=1024 "
                + std::string(m32 ? "-m32 " : "") + " \""
                + cfile.string() + "\" -o \""
                + llfile.string() + "\""
            };

            int result = std::system(cmd.c_str());
            if (result != 0)
                continue; // Error!

            std::unique_ptr<llvm::Module> M2 = llvm::parseIRFile(llfile.c_str(), D, C);
            if (M2 == nullptr)
                continue; // Error!
            
            if (M == nullptr)
            {
                M.swap(M2);
                L = std::make_unique<llvm::Linker>(*M);
            }
            else
                L->linkInModule(std::move(M2));
        }
    }

    if (M == nullptr)
        return {}; // Error!

    std::ofstream  ostr(out_file.c_str(), std::ios::binary);
    llvm::raw_os_ostream ros(ostr);
    M->print(ros, 0);
    ros.flush();

    return out_file.string();
}


static std::string  get_or_build_main_file(std::string const&  data_root_dir, std::string const&  main_version, bool const  m32)
{
    std::filesystem::path const  out_file{ data_root_dir + "/main_versions/ll/" + main_version + (m32 ? "_m32" : "") + ".ll" };
    if (std::filesystem::is_regular_file(out_file))
        return out_file.string();
    std::filesystem::create_directories(out_file.parent_path());

    llvm::SMDiagnostic D;
    llvm::LLVMContext C;
    std::unique_ptr<llvm::Module> M;
    std::unique_ptr<llvm::Linker> L;

    for (auto const&  entry : std::filesystem::recursive_directory_iterator(data_root_dir + "/main_versions/c/"))
    {
        if (!entry.is_regular_file())
            continue;

        if (entry.path().extension() == ".c")
        {
            std::filesystem::path cfile = entry.path();
            
            // Make output .ll file path (mirror directory structure)
            std::filesystem::path relative = std::filesystem::relative(cfile, data_root_dir + "/main_versions/c/");
            std::filesystem::path llfile = std::filesystem::path(data_root_dir) / "main_versions" / "ll" / relative;
            llfile.replace_extension("");
            llfile = llfile.string() + (m32 ? "_m32" : "") + ".ll";
            std::filesystem::create_directories(llfile.parent_path());

            std::string const  cmd {
                "clang -O0 -g -S -emit-llvm -Wno-everything -fbracket-depth=1024 "
                + std::string(m32 ? "-m32 " : "") + " \""
                + cfile.string() + "\" -o \""
                + llfile.string() + "\""
            };

            std::system(cmd.c_str());
        }
    }

    if (std::filesystem::is_regular_file(out_file))
        return out_file.string();

    return {};
}


void  remove_unused_code(llvm::Module&  M)
{
    for (int i = 0; i < 2; ++i)
        for (auto it = M.begin(), end = M.end(); it != end;)
        {
            llvm::Function &F = *it++;
            if (!F.isDeclaration() && F.use_empty() && F.getName().starts_with(FIZZER_MODEL_PREFIX))
                F.eraseFromParent();
        }
    for (auto it = M.global_begin(), end = M.global_end(); it != end;)
    {
        llvm::GlobalVariable &G = *it++;
        if (!G.isDeclaration() && G.use_empty() && G.getName().starts_with(FIZZER_MODEL_PREFIX))
            G.eraseFromParent();
    }
}


void run(int argc, char* argv[])
{
    TMPROF_BLOCK();

    if (get_program_options()->has("help"))
    {
        std::cout << get_program_description() << std::endl << get_program_options() << std::endl;
        return;
    }
    if (get_program_options()->has("version"))
    {
        std::cout << get_program_version() << std::endl;
        return;
    }
    if (!get_program_options()->has("input"))
    {
        std::cout << "No input file was specified." << std::endl;
        return;
    }
    if (!std::filesystem::is_regular_file(get_program_options()->value("input")))
    {
        std::cout << "Cannot access the input file: " << get_program_options()->value("input") << std::endl;
        return;
    }
    if (!get_program_options()->has("data"))
    {
        std::cout << "Data root directory was not specified." << std::endl;
        return;
    }
    if (!get_program_options()->has("output"))
    {
        std::cout << "No output file was specified." << std::endl;
        return;
    }

    llvm::SMDiagnostic D;
    llvm::LLVMContext C;
    std::unique_ptr<llvm::Module> M;
    {
        TMPROF_BLOCK();

        M = llvm::parseIRFile(get_program_options()->value("input"), D, C);
        if (M == nullptr)
        {
            //D.print(get_program_options()->value("input").c_str(), D());
            llvm::raw_os_ostream ros(std::cout);
            D.print(std::filesystem::path(get_program_options()->value("input")).filename().string().c_str(),ros,false);
            ros.flush();
            return;
        }
    }

    llvm::Linker  linker(*M);

    //bool const  m32{ M->getDataLayout().getPointerSize() == 4 };
    std::string const  target_triple = M->getTargetTriple();
    llvm::Triple const  llvm_triple{ target_triple };
    bool const  m32{ llvm_triple.isArch32Bit() };

    std::string const  model_ll_file{ get_or_build_model_file(
            get_program_options()->value("data"),
            std::filesystem::path(get_program_options()->value("output")).parent_path().string(),
            m32
            )
    };
    if (!model_ll_file.empty())
    {
        std::unique_ptr<llvm::Module> M2 = llvm::parseIRFile(model_ll_file, D, C);
        if (M2 != nullptr)
        {
            if (linker.linkInModule(std::move(M2)) == false)
            {
                std::unordered_map<std::string, llvm::Function*>  fizzer_functions;
                for (llvm::Function* F : get_defined_fizzer_functions(*M))
                    fizzer_functions.insert({ F->getName().str(), F });

                for (llvm::Function* F : get_declared_functions(*M))
                {
                    auto const  fit = fizzer_functions.find(FIZZER_MODEL_PREFIX + F->getName().str());
                    if (fit != fizzer_functions.end())
                    {
                        //assert(F->getFunctionType() == fit->second->getFunctionType());
                        for (auto uit = F->user_begin(), end = F->user_end(); uit != end; ) {
                            llvm::User *U = *uit++;
                            if (auto *CE = llvm::dyn_cast<llvm::ConstantExpr>(U)) {
                                CE->replaceAllUsesWith(llvm::ConstantExpr::getBitCast(fit->second, CE->getType()));
                                CE->destroyConstant();
                            }
                        }
                        F->replaceAllUsesWith(fit->second);
                    }
                }
            }
        }
    }

    llvm::Function *main_function = M->getFunction("main");
    if (main_function != nullptr)
    {
        llvm::FunctionType* const  FT = main_function->getFunctionType();
        llvm::Type* const  ret_type = FT->getReturnType();
        if ((ret_type->isVoidTy() || ret_type->isIntegerTy(32)) && (FT->getNumParams() == 0 || FT->getNumParams() == 2))
        {
            main_function->setName(FIZZER_METHOD_UNDER_TEST);

            std::string  main_version;
            if (FT->getNumParams() == 0)
            {
                main_version = ret_type->isVoidTy() ? "void_void" : "int_void";
            }
            else if (get_program_options()->has("noargs"))
            {
                main_version = ret_type->isVoidTy() ? "void_args_dummy" : "int_args_dummy";
            }
            else
            {
                main_version = ret_type->isVoidTy() ? "void_args" : "int_args";
            }
            //std::cout << "MAIN: " << main_version << "\n\n";
            std::string const  main_ll_file{ get_or_build_main_file(
                    get_program_options()->value("data"),
                    main_version,
                    m32
                )
            };
            if (!main_ll_file.empty())
            {
                std::unique_ptr<llvm::Module> M2 = llvm::parseIRFile(main_ll_file, D, C);
                if (M2 != nullptr)
                    linker.linkInModule(std::move(M2));
            }
        }
    }

    remove_unused_code(*M);

    {
        TMPROF_BLOCK();

        std::ofstream  ostr(get_program_options()->value("output").c_str(), std::ios::binary);
        llvm::raw_os_ostream ros(ostr);
        M->print(ros, 0);
        ros.flush();
    }
}
