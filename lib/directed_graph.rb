#lib/directed_graph.rb

class DirectedGraph

	def initialize()
		@vertices = {}
	end

	#accessor methods:

	#returns array of all of ther vertex values
	def vertices
		@vertices.keys
	end

	#returns an array of all of the out neighbors of a vertex
	def out_neighbors(vertex)
	end

	#returns an array of all of a vertex's in_neighbors
	def in_neighbors(vertex)
	end

	#just returns the out_neighbors
	def neighbors(vertex)
	end

	#returns the weight of the edge between two vertices (vertex1 -> vertex2)
	#if there is no edge throws and ArgumentError
	def weight(vertex1, vertex2)
		if !has_vertex?(vertex1) || !has_vertex?(vertex2)
			raise ArgumentError.new('Given vertex does not exist in graph')
		elsif !has_edge?(vertex1, vertex2)
			raise ArgumentError.new('Given edge does not exist in graph')
		end

		return @vertices[vertex1][vertex2]
	end

	#given a vertex v, returns a vertex w if weight(v, w) is the largest for all w defined for v
	def heaviest_neighbor(vertex)
	end

	#returns given a vertex v, returns a vertex w if weight(v, w) is the smallest for all w defined for v
	def lightest_neighbor(vertex)
	end

	#returns true iff this.vertices.contains?(vertex)
	def has_vertex?(vertex)
		@vertices.has_key?(vertex)
	end

	#returns true iff vertex1.neighbors.contains?(vertex2) || vertex2.neighbors.contains?(vertex1)
	def has_edge?(vertex1, vertex2)
		if !has_vertex?(vertex1) || !has_vertex?(vertex2)
			raise ArgumentError.new('Given vertex does not exist in graph')
		end

		@vertices[vertex1].has_key?(vertex2)
	end

	#returns the number of vertices in the graph
	def size
		@vertices.size
	end

	#mutator methods:

	#adds a vertex to the graph
	#if a vertex is already in the graph, does nothing
	#returns true iff a vertex was added (false if the vertex was already in the graph)
	def add_vertex!(vertex)
		if has_vertex?(vertex)
			return false
		else
			@vertices[vertex] = {}
			return true
		end
	end

	#adds an edge with the given weight between two vertices, starting at vertex1 and pointing to the vertex2
	#if there is already an edge with said weight, it updates the weight
	#if either one (or both) of the vertices are not in the graph, it throws an ArgumentError
	def add_edge!(vertex1, vertex2, weight)
		if !has_vertex?(vertex1) || !has_vertex?(vertex2)
			raise ArgumentError.new('Given vertex does not exist in graph')
		end

		new_edge = !has_edge?(vertex1, vertex2)

		ehash = @vertices[vertex1]
		ehash[vertex2] = weight

		return new_edge
	end

	#removes a vertex and and edges associated with it
	#if there is no such vertex in the graph, throws an ArgumentError
	#returns a hash of the removed vertex's neighborhood
	def remove_vertex!(vertex)

	end

	#removes an edge between two vertices (vertex1 -> vertex2)
	#returns the weight of the removed edge
	#if there was no such edge (or either one of the vertices were not in the vertex, throws an ArgumentError)
	def remove_edge!(vertex1, vertex2)
		if !has_vertex?(vertex1) || !has_vertex?(vertex2)
			raise ArgumentError.new('Given vertex does not exist in graph')
		elsif !has_edge?(vertex1, vertex2)
			raise ArgumentError.new('Given edge does not exist in graph')
		end

		@vertices[vertex1].delete(vertex2)
	end

end
