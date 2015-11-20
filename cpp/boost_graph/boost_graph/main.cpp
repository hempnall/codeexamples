#include <iostream>                  // for std::cout
#include <utility>                   // for std::pair
#include <algorithm>                 // for std::for_each
#include <boost/graph/graph_traits.hpp>
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/dijkstra_shortest_paths.hpp>
#include <boost/graph/graphviz.hpp>
#include <boost/graph/adjacency_list.hpp>
#include <string>
#include <fstream>
#include <boost/graph/iteration_macros.hpp>



using namespace boost;


template <class Graph> struct exercise_vertex {
  exercise_vertex(Graph& g_) : g(g_) {}
  //...
  Graph& g;

  typedef typename graph_traits<Graph>
    ::vertex_descriptor Vertex;

  void operator()(const Vertex& v) const
  {
    //...
  }
};

int main(int,char*[])
{


    typedef boost::adjacency_list<vecS, vecS, undirectedS,
                                  property<vertex_name_t, std::string>,
                                  property<edge_weight_t, double> > Graph;



    typedef graph_traits<Graph>::vertex_descriptor Vertex;
    typedef std::pair<int,int> E;

    const int num_nodes = 5;
    E edges[] = { E(0,2),
                  E(1,1), E(1,3), E(1,4),
                  E(2,1), E(2,3),
                  E(3,4),
                  E(4,0), E(4,1) };
    int weights[] = { 1, 2, 1, 2, 7, 3, 1, 1, 1};

    Graph G(edges, edges + sizeof(edges) / sizeof(E), weights, num_nodes);
     typedef property_map<Graph, vertex_index_t>::type IndexMap;


    IndexMap index = get(vertex_index, G);

    property_map<Graph, vertex_name_t>::type dd = get(vertex_name, G);

    typedef graph_traits<Graph>::vertex_iterator vertex_iter;
    std::pair<vertex_iter, vertex_iter> vp;
    for (vp = vertices(G); vp.first != vp.second; ++vp.first) {
      std::cout << index[*vp.first] <<  " ";
        std::string vertex_name_id = std::string( "name ") + std::to_string(index[*vp.first]);
        put(dd,*vp.first,vertex_name_id);
    }

    // vector for storing distance property
    std::vector<int> d(num_vertices(G));

    // get the first vertex
    Vertex s = *(vertices(G).first);
    // invoke variant 2 of Dijkstra's algorithm
    dijkstra_shortest_paths(G, s, distance_map(&d[0]));

    std::cout << "distances from start vertex:" << std::endl;
    graph_traits<Graph>::vertex_iterator vi;
    for(vi = vertices(G).first; vi != vertices(G).second; ++vi)
      std::cout << "distance(" << index(*vi) << ") = "
                << d[*vi] << std::endl;
    std::cout << std::endl;

    dynamic_properties dp;
    dp.property("id", get(vertex_name, G));
//    dp.property("weight", get(edge_weight, G));

    // Write out the graph
    write_graphviz_dp(std::cout, G, dp, std::string("id"));

  return 0;
}
