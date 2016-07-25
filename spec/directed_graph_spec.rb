#spec/directed_graph_spec.rb

require "directed_graph"

describe DirectedGraph do

	#First, accessor methods on an empty graph (to set a good base)
	describe "empty graph" do
		blank = DirectedGraph.new()

		describe ".vertices" do
			context "given an empty graph" do
				it "returns an empty hash" do
					expect(blank.vertices().length()).to eql(0)
				end
			end
		end

		describe ".size" do
			context "given empty graph" do
				it "size should be 0" do
					expect(blank.size()).to eql(0)
				end
			end
		end


	end

	#mutator methods first:
	describe ".add_vertex!" do
		context "given an empty graph" do
			it "adds exactly one vertex" do
				g = DirectedGraph.new()

				expect(g.add_vertex!("Water")).to eql(true)
				expect(g.size).to eql(1)
				expect(g.has_vertex?("Water")).to eql(true)
			end
		end

		context "graph with different element in it" do
			it "adds the element" do
				g = DirectedGraph.new()
				g.add_vertex!("Water")

				expect(g.add_vertex!("Fire")).to eql(true)
				expect(g.size).to eql(2)
				expect(g.has_vertex?("Fire")).to eql(true)
				expect(g.has_vertex?("Water")).to eql(true)
			end
		end

		context "given a graph with the same element in it" do
			it "doesn't add the element" do
				g = DirectedGraph.new()
				g.add_vertex!("Water")

				expect(g.add_vertex!("Water")).to eql(false)
				expect(g.size).to eql(1)
			end
		end
	end

	describe ".add_edge!" do
		context "given vertices not in the graph" do
			it "throw an error" do
				expect{DirectedGraph.new().add_edge!("Grass", "Electric", 3)}.to raise_error(ArgumentError)
			end
		end

		context "given vertices without an edge between them" do
			it "creates an edge pointing from one to the other" do
				g = DirectedGraph.new()
				g.add_vertex!("Dragon")
				g.add_vertex!("Fairy")

				expect(g.add_edge!("Dragon", "Fairy", 2)).to eql(true)
				expect(g.has_edge?("Dragon", "Fairy")).to eql(true)
				expect(g.weight("Dragon", "Fairy")).to eql(2)

				expect(g.has_edge?("Fairy", "Dragon")).to eql(false)
			end
		end

		context "given vertices with an edge already between them" do
			it "updates the edge weight" do
				g = DirectedGraph.new()
				g.add_vertex!("Dragon")
				g.add_vertex!("Fairy")
				g.add_edge!("Dragon", "Fairy", 0)

				expect(g.add_edge!("Dragon", "Fairy", 2)).to eql(false)
				expect(g.has_edge?("Dragon", "Fairy")).to eql(true)
				expect(g.weight("Dragon", "Fairy")).to eql(2)

				expect(g.has_edge?("Fairy", "Dragon")).to eql(false)
			end
		end

	end

	describe ".remove_edge!" do
		context "given vertices not in the graph" do
			it "throw an error" do
				expect{DirectedGraph.new().remove_edge!("Grass", "Electric")}.to raise_error(ArgumentError)
			end
		end

		context "given an edge not in graph" do
			it "throw an error" do
				g = DirectedGraph.new()
				g.add_vertex!("Grass")
				g.add_vertex!("Electric")

				expect{g.remove_edge!("Grass", "Electric")}.to raise_error(ArgumentError)
			end
		end

		context "given an edge in the graph" do
			it "removes the edge between both vertices" do
				g = DirectedGraph.new()
				g.add_vertex!("Fighting")
				g.add_vertex!("Steel")
				g.add_edge!("Fighting", "Steel", 2)

				expect(g.remove_edge!("Fighting", "Steel")).to eql(2)
				expect(g.has_edge?("Fighting", "Steel")).to eql(false)
			end
		end

		context "given a 2-way edge in graph" do
			it "only removes one way" do
				g = DirectedGraph.new()
				g = DirectedGraph.new()
				g.add_vertex!("Fighting")
				g.add_vertex!("Steel")
				g.add_edge!("Fighting", "Steel", 2)
				g.add_edge("Steel", "Fighting", 1)

				expect(g.remove_edge!("Fighting", "Steel")).to eql(2)
				expect(g.has_edge?("Fighting", "Steel")).to eql(false)
				expect(g.weight("Steel", "Fighting")).to eql(1)
			end
		end
	end

end