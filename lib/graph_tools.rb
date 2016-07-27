#lib/graph_tools.rb

module GraphTools

	require 'set'

	#returns the shortest path between two vertices (via Dijkstra's algorithm)
	def shortest_path(graph, starting_node, ending_node)

		parent = {}
		dist = {}
		graph.vertices.each do |v|
			dist[v] = Float::INFINITY
			parent[v] = nil
		end
		dist[starting_node] = 0
		parent[starting_node] = starting_node


	end

	#returns a graph that's an MST (w/ Kruskle's) of the graph
	def mst(graph)
	end

	def bfs(graph, root, target)
	end

	def breadth_first_search(graph, root, target)
		bfs(graph, root, target)
	end

	def dfs(graph, root, target)
	end 

	def depth_first_search(graph, root, target)
		dfs(graph, root, target)
	end

end
