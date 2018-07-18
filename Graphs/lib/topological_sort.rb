require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
    # Khan's

    queue = []
    list = []

    vertices.each do |vertex|
        if vertex.in_edges.empty? 
            queue.push(vertex)
        end
    end

    return [] if queue.empty?

    until queue.empty?
        delete = []
        vertex = queue.shift
        list.push(vertex)

        vertex.out_edges.each do |edge|
            to_vert = edge.to_vertex
            
            if to_vert.in_edges.length == 1
                queue.push(edge.to_vertex)
            end
            
            delete.push(edge)
        end

        vertices.delete(vertex)

        delete.each do |edge|
            edge.destroy!
        end
    end

    return [] if vertices.length > 0

    return list

    # Tarian's
    # if vertices.length <= 1
    #     return vertices 
    # end

    # leafs = []
    # out = []

    # vertices.each do |vertex|
    #     delete = []

    #     if vertex.out_edges.empty?
    #         leafs.unshift(vertex)
    #         vertex.in_edges.each do |edge|
    #            delete.push(edge)
    #         end
            
    #         vertices.delete(vertex)
    #     end

    #     delete.each do |edge|
    #         edge.destroy!
    #     end
    # end

    # return leafs if leafs.empty?


    # p vertices,leafs
    # return topological_sort(vertices) + leafs
end
