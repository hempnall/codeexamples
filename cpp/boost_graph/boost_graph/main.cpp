#include <iostream>                  // for std::cout
#include <utility>                   // for std::pair
#include <algorithm>                 // for std::for_each
#include <boost/graph/graph_traits.hpp>
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/dijkstra_shortest_paths.hpp>

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
//  // create a typedef for the Graph type
//  typedef adjacency_list<vecS, vecS, bidirectionalS> Graph;

//  // Make convenient labels for the vertices
//  enum { A, B, C, D, E, N };
//  const int num_vertices = N;
//  const char* name = "ABCDE";

//  // writing out the edges in the graph
//  typedef std::pair<int, int> Edge;
//  Edge edge_array[] =
//          { Edge(A,B), Edge(A,D), Edge(C,A), Edge(D,C),
//            Edge(C,E), Edge(B,D), Edge(D,E) };


//  const int num_edges = sizeof(edge_array)/sizeof(edge_array[0]);

//  // declare a graph object
//    Graph g(edge_array, edge_array + sizeof(edge_array) / sizeof(Edge), num_vertices);
//    typedef graph_traits<Graph>::vertex_descriptor Vertex;

//    // get the property map for vertex indices
//    typedef property_map<Graph, vertex_index_t>::type IndexMap;
//    IndexMap index = get(vertex_index, g);

//    std::cout << "vertices(g) = ";
//    typedef graph_traits<Graph>::vertex_iterator vertex_iter;
//    std::pair<vertex_iter, vertex_iter> vp;
//    for (vp = vertices(g); vp.first != vp.second; ++vp.first) {
//      Vertex v = *vp.first;
//      std::cout << index[v] <<  " ";
//    }
//    std::cout << std::endl;
//    // ...
//    std::cout << "edges(g) = ";
//    graph_traits<Graph>::edge_iterator ei, ei_end;
//    for (boost::tie(ei, ei_end) = edges(g); ei != ei_end; ++ei)
//        std::cout << "(" << index[source(*ei, g)]
//                  << "," << index[target(*ei, g)] << ") ";
//    std::cout << std::endl;
//    std::for_each(vertices(g).first, vertices(g).second,
//                  exercise_vertex<Graph>(g));



    // get the property map for vertex indices



    typedef adjacency_list<listS, vecS, directedS,
                           no_property, property<edge_weight_t, int> > Graph;


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

  return 0;
}
