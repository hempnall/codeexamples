// torun: export DYLD_LIBRARY_PATH=/Users/James/dev/src/boost_1_58_0/stage/lib:$DYLD_LIBRARY_PATH

#include <fstream>
#include <iostream>
#include <boost/iostreams/filtering_streambuf.hpp>
#include <boost/iostreams/filter/zlib.hpp>
#include <boost/iostreams/filtering_stream.hpp>
#include <boost/iostreams/copy.hpp>
#include <boost/iostreams/filter/gzip.hpp>

namespace bo = boost::iostreams;
int main()
{
    {
    std::ofstream ofile("hello.gz", std::ios_base::out | std::ios_base::binary);
    bo::filtering_ostream out;
    out.push(bo::gzip_compressor());
    out.push(ofile);
    out << "This is a gz file\n";
    }

    {
    std::ifstream ifile("hello.gz", std::ios_base::in | std::ios_base::binary);
    bo::filtering_streambuf<bo::input> in;
    in.push(bo::gzip_decompressor());
    in.push(ifile);
    boost::iostreams::copy(in, std::cout);
    }

    {
    std::ofstream ofile("hello.z", std::ios_base::out | std::ios_base::binary);
    bo::filtering_ostream out;
    out.push(bo::zlib_compressor());
    out.push(ofile);
    out << "This is a gz file\n";
    }

    {
        std::ifstream ifile("hello.z", std::ios_base::in | std::ios_base::binary);
        bo::filtering_streambuf<bo::input> in;
        in.push(bo::zlib_decompressor());
        in.push(ifile);
        boost::iostreams::copy(in, std::cout);
    }

    {
        // this one will error on the compreesion found in FlateDecode pdf streams!!! - use zlib instead
//        std::ifstream ifile("../out3.bin", std::ios_base::in | std::ios_base::binary);
//        bo::filtering_streambuf<bo::input> in;
//        in.push(bo::gzip_decompressor());
//        in.push(ifile);
//        boost::iostreams::copy(in, std::cout);
    }


    {
        // this is the one you need for compression in pdf files
        std::ifstream ifile("../out3.bin", std::ios_base::in | std::ios_base::binary);
        bo::filtering_streambuf<bo::input> in;
        in.push(bo::zlib_decompressor());
        in.push(ifile);
        boost::iostreams::copy(in, std::cout);
    }

}
