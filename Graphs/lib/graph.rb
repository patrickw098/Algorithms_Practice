class Vertex
  attr_accessor :in_edges, :out_edges, :value

  def initialize(value)
    @in_edges = []
    @out_edges = [] 
    @value = value
  end

  def inspect 
    @value
  end

  def to_s
    @value
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex 
    @to_vertex = to_vertex
    @cost = cost 
    from_vertex.out_edges.push(self)
    to_vertex.in_edges.push(self)
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex = nil 
    @to_vertex = nil
  end
end
