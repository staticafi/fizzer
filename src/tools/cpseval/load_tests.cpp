#include <cpseval/load_tests.hpp>
#include <com/record_type.hpp>
#include <boost/property_tree/xml_parser.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/multiprecision/cpp_int.hpp>
#include <unzip.h>  // From Minizip
#include <filesystem>


template<typename T>
void  extend_test(test_case&  out_test, T const value, fuzzing::data_type const  type)
{
    std::size_t const  orig_size{ out_test.bytes.size() };
    out_test.bytes.resize(orig_size + sizeof(T));
    std::copy((natural_8_bit const*)&value, ((natural_8_bit const*)&value) + sizeof(T), out_test.bytes.data() + orig_size);

    out_test.types.push_back(type);
    out_test.metadata.push_back(com::to_record_id(com::record_type::SIMPLE));
}


bool  load_test(std::vector<natural_8_bit> const&  xml_bytes, test_case&  out_test)
{
    boost::property_tree::ptree  ptree;
    {
        std::istringstream  xml_stream(std::string(xml_bytes.begin(), xml_bytes.end()));
        read_xml(xml_stream, ptree);
    }
    for (auto const& [name, node] : ptree.get_child("testcase"))
        if (name == "input")
        {
            std::string const type{ node.get<std::string>("<xmlattr>.type", "") };
            std::string data{ node.data() };
            boost::trim(data);
            if (data.length() == 3 && ( data[0] == '\'' && data[2]== '\'') || ( data[0] == '\"' && data[2]== '\"'))
                data = std::to_string(data[1]);
            else if (data.starts_with("0x"))
                data = boost::multiprecision::cpp_int(data).str();

            static std::unordered_map<std::string, std::function<void(std::string const&, test_case&)> > const load_data{
#               define DEF_DATA(KEY, CTYPE, DTYPE) { #KEY, [](std::string const&  data, test_case&  out_test) { \
                    extend_test(out_test, boost::lexical_cast<CTYPE>(data), fuzzing::data_type::DTYPE); } }
#               define DEF_DATA_CAST(KEY, CTYPE, PTYPE, DTYPE) { #KEY, [](std::string const&  data, test_case&  out_test) { \
                    extend_test(out_test, (CTYPE)boost::lexical_cast<PTYPE>(data), fuzzing::data_type::DTYPE); } }
#               define DEF_DATA_EX(KEY, CTYPE, DTYPE32, DTYPE64) { #KEY, [](std::string const&  data, test_case&  out_test) { \
                    extend_test(out_test, boost::lexical_cast<CTYPE>(data), \
                                sizeof(CTYPE) == 4ULL ? fuzzing::data_type::DTYPE32 : fuzzing::data_type::DTYPE64); } }

                DEF_DATA(bool, bool, BOOLEAN),
                DEF_DATA(_Bool, bool, BOOLEAN),

                DEF_DATA_CAST(char, char, int, SINT8),
                DEF_DATA_CAST(uchar, unsigned char, unsigned int, UINT8),
                DEF_DATA_CAST(unsigned char, unsigned char, unsigned int, UINT8),

                DEF_DATA(short, short, SINT16),
                DEF_DATA(ushort, unsigned short, UINT16),
                DEF_DATA(unsigned short, unsigned short, UINT16),

                DEF_DATA(int, int, SINT32),
                DEF_DATA(uint, unsigned int, UINT32),
                DEF_DATA(unsigned int, unsigned int, UINT32),
                DEF_DATA(u32, unsigned int, UINT32),

                DEF_DATA_EX(long, long, SINT32, SINT64),
                DEF_DATA_EX(ulong, unsigned long, UINT32, UINT64),
                DEF_DATA_EX(unsigned long, unsigned long, UINT32, UINT64),

                DEF_DATA_EX(longlong, long long, SINT32, SINT64),
                DEF_DATA_EX(ulonglong, unsigned long long, UINT32, UINT64),
                DEF_DATA_EX(unsigned long long, unsigned long long, UINT32, UINT64),

                DEF_DATA_EX(size_t, std::size_t, UINT32, UINT64),
                DEF_DATA_EX(loff_t, loff_t, UINT32, UINT64),
                DEF_DATA_EX(pthread_t, pthread_t, UINT32, UINT64),
                DEF_DATA(sector_t, std::uint64_t, UINT64),
                DEF_DATA(pchar, std::uint64_t, UINT64),

                DEF_DATA(float, float, FLOAT32),
                DEF_DATA(double, double, FLOAT64),

#               undef DEF_DATA
#               undef DEF_DATA_CAST
#               undef DEF_DATA_EX
            };

            auto const it{ load_data.find(type) };
            if (it == load_data.end())
                return false;
            try { it->second(data, out_test); } catch (...) { return false; }
        }
    return true;
}


bool  load_tests(std::string const&  zip_path, std::string const&  dir_name, std::vector<test_case_ptr>&  out_tests)
{
    unzFile zip = unzOpen(zip_path.c_str());
    if (zip == nullptr)
        return false;
    if (unzGoToFirstFile(zip) != UNZ_OK)
    {
        unzClose(zip);
        return false;
    }
    bool  result{ true };
    do
    {
        char file_name_c[10000];
        unz_file_info file_info;
        if (unzGetCurrentFileInfo(zip, &file_info, file_name_c, sizeof(file_name_c), nullptr, 0, nullptr, 0) != UNZ_OK)
        { result = false; continue; }

        std::string const file_name{ file_name_c };
        if (file_name.back() == '/'
                || !boost::starts_with(file_name, dir_name)
                || !boost::ends_with(file_name, ".xml")
                || boost::ends_with(file_name, "/metadata.xml"))
            continue;

        if (unzOpenCurrentFile(zip) != UNZ_OK)
        { result = false; continue; }

        std::vector<natural_8_bit> buffer(file_info.uncompressed_size);
        if (unzReadCurrentFile(zip, buffer.data(), buffer.size()) != file_info.uncompressed_size)
        { unzCloseCurrentFile(zip); result = false; continue; }

        out_tests.push_back(std::make_shared<test_case>());
        try
        {
            if (!load_test(buffer, *out_tests.back()))
                result = false;
        }
        catch (...)
        {
            out_tests.pop_back();
            result = false;
        }

        unzCloseCurrentFile(zip);
    }
    while (unzGoToNextFile(zip) == UNZ_OK);

    unzClose(zip);

    return result;
}
