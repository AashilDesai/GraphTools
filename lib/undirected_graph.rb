#lib/undirected_graph.rb

class undirected_graph
def initialize()
	end

	#accessor methods:
	
	#returns array of all of ther vertex values
	def vertices

	end

	#just returns the neighbors
	def neighbors(vertex)
	end

	#returns the weight of the edge between two vertices
	#if there is no edge throws and ArgumentError
	def weight(vertex1, vertex2)
	end

	#given a vertex v, returns a vertex w if weight(v, w) is the largest for all w defined for v
	def heaviest_neighbor(vertex)
	end

	#returns given a vertex v, returns a vertex w if weight(v, w) is the smallest for all w defined for v
	def lightest_neighbor(vertex)
	end

	#returns true iff this.vertices.contains?(vertex)
	def contains?(vertex)
	end

	#returns true iff vertex1.neighbors.contains?(vertex2)
	def neighbors?(vertex1, vertex2)
	end

	#returns the number of vertices in the graph
	def size
	end

	#mutator methods:

	#adds a vertex to the graph
	#if a vertex is already in the graph, does nothing
	#returns true iff a vertex was added (false if the vertex was already in the graph)
	def add_vertex(vertex)
	end

	#adds an edge with the given weight between two vertices, starting at vertex1 and pointing to the vertex2
	#if there is already an edge with said weight, it updates the weight
	#if either one (or both) of the vertices are not in the graph, it throws an ArgumentError
	def add_edge(vertex1, vertex2, weight)
	end

	#removes a vertex and and edges associated with it
	#if there is no such vertex in the graph, throws an ArgumentError
	#returns the removed vertex
	def remove_vertex(vertex)
	end

	#removes an edge between two vertices
	#returns the weight of the removed edge
	#if there was no such edge (or either one of the vertices were not in the vertex, throws an ArgumentError)
	def remove_edge(vertex1, vertex2)
	end

end 