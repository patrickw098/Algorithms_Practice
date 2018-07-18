# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative "graph"
require_relative "topological_sort"

def install_order(arr)
    vertices_map = {}
    max = arr.sort_by { |el| el[0] }
    max = max.last[0]

    arr.each_with_index do |el, index|
        dependency = el[1]
        dependent = el[0]

        if vertices_map[el[1]].nil?
            dependency = Vertex.new(dependency)
            vertices_map[el[1]] = dependency
        else 
            dependency = vertices_map[dependency]
        end 

        if vertices_map[el[0]].nil?
            dependent = Vertex.new(dependent)
            vertices_map[el[0]] = dependent
        else
            dependent = vertices_map[dependent]
        end

        edge = Edge.new(dependency, dependent)
    end

    keys = vertices_map.keys 
    max_arr = (1..max).to_a

    exclusive = keys + max_arr -  ( keys & max_arr)

    exclusive.each do |missing_vert|
        vertices_map[missing_vert] = Vertex.new(missing_vert)
    end

    sort = topological_sort(vertices_map.values)
    sort = sort.map { |el| el.value }

    sort
end
