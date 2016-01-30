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
}
