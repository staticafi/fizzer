#include <fuzzing/dump_native.hpp>
#include <utility/math.hpp>
#include <utility/assumptions.hpp>
#include <iostream>
#include <iomanip>

namespace  fuzzing {


void  save_execution_results(std::ostream&  ostr, execution_results const&  results, std::string const&  shift)
{
    ostr << shift << "\"termination\": " << com::to_string(results.get_termination()) << ",\n"
         << shift << "\"bytes\": \"";
    for (natural_8_bit  byte : *results.get_bytes())
        ostr << std::setw(2) << std::setfill('0') << std::hex << (natural_32_bit)byte;
    ostr << "\",\n" << shift << "\"types\": \"";
    for (data_type  type : *results.get_types())
        ostr << std::setw(2) << std::setfill('0') << std::hex << (natural_32_bit)com::to_type_id(type);
    ostr << "\",\n" << shift << "\"metadata\": \"";
    for (natural_8_bit  byte : *results.get_metadata())
        ostr << std::setw(2) << std::setfill('0') << std::hex << (natural_32_bit)byte;
    ostr << "\",\n" << std::setfill(' ') << std::dec << shift << "\"trace\": [ ";
    bool first{ true };
    for (com::trace_item const&  item : *results.get_trace())
    {
        if (first) first = false; else ostr << ',';
        ostr << item.id << ',' << (item.direction ? 1 : 0);
    }
    ostr << " ]\n";
}


void  save_native_test(std::ostream&  ostr, test_suite_item const&  item)
{
    std::string const  shift = "    ";

    ostr
        << "{\n"
        << shift << "\"any_location_discovered\": " << (item.any_location_discovered ? 1 : 0) << ",\n"
        << shift << "\"covered_locations\": [ ";
    bool first{ true };
    for (location_id const&  id : item.covered_locations)
    {
        if (first) first = false; else ostr << ',';
        ostr << id;
    }
    ostr
        << " ],\n"
        << shift << "\"analysis_name\": \"" << item.analysis_name << "\",\n"
        << shift << "\"execution_results\": {\n"
        ;
    save_execution_results(ostr, *item.results, shift + "    ");
    ostr << shift << "}\n}";
}


}
