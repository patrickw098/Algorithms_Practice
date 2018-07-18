require 'byebug'

class DynamicProgramming

  def initialize
    @cache = { 1 => 1, 2 => 2}
    @knapsack = {}
    @visited = []
    @queue = []
  end

  def blair_nums(n)
    return @cache[n] if @cache[n]

    #n-1 odd

    odd = (n - 2) * 2 + 1

    ans = blair_nums(n - 1) + blair_nums(n - 2) + odd

    @cache[n] = ans

    return ans
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)

    return cache[n] 
  end

  def frog_cache_builder(n)
    cache = {
        0 => [],
        1 => [[1]],
        2 => [[1,1],[2]],
        3 => [[1,1,1],[1,2],[2,1],[3]]
      }

    if n <= 3
      return cache 
    else 
      (4..n).each do |num|
        steps = []

        (1..num - 1).each do |step_num|
          first_half = cache[step_num]
          first_half = first_half[step_num - 1..-1]
          second_half = cache[num - step_num]
          # second_half = second_half[0..num - step_num]

       

          first_half.each do |pattern|
            second_half.each do |second_pattern|
              steps.push(pattern + second_pattern)
            end
          end
        end

        cache[num] = steps.uniq
      end

      return cache
    end
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return [[]] if n <= 0 
    return [[1]] if n == 1
    return [[1,1],[2]] if n == 2
    return [[1,1,1],[1,2],[2,1],[3]] if n == 3

    final_solution = []

    (1..3).each do |jump|
      break if jump > n 
      one_step = frog_hops_top_down_helper(jump)[-1]
      remaining = frog_hops_top_down(n - jump)

      [one_step].each do |solution|
        remaining.each do |remaining_solution|
          final_solution.push(solution + remaining_solution)
        end
      end
    end

    return final_solution
  end

  def super_frog_hops(n, k)
    return [[]] if n == 0
    return [[1]] if n == 1

    solution = []

      (1..k).each do |jump|
        break if jump > n

        one_step = jump == n ? [n] : super_frog_hops(jump, k)[-1]
        next_step = super_frog_hops(n - jump, k)
        
        [one_step].each do |single_step|
          next_step.each do |prev_step|
            solution.push(single_step + prev_step)
          end
        end 
      end

    return solution
  end

  def knapsack(weights, values, capacity)
    max = knapsack_table(weights, values, capacity)[-1]

    max[-1]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    return [0] if capacity == 0
    table = [Array.new(capacity, 0)]

    (0...weights.length).each do |i|
      row = []
      prev = table[i]
      (1..capacity).each_with_index do |cap, j|
        prev_weight = cap - weights[i] - 1
        if prev_weight >= 0 && prev[prev_weight] + values[i] > prev[j]
          row.push(prev[prev_weight] + values[i])
        elsif prev[j] > values[i]
          row.push(prev[j])
        elsif weights[i] <= cap
          row.push(values[i])
        else 
          row.push(0)
        end
      end

      table.push(row)
    end

    return table
  end

  #   def knapsack(weights, values, capacity)
  #   knapsack_table(weights, values, capacity)
  #   @knapsack[capacity].last
  # end

  # # Helper method for bottom-up implementation
  # # you must select the optimum from between these two paradigms: use either the previous item solution at this capacity, or the previous item solution from a smaller bag plus this item's value.
  # def knapsack_table(weights, values, capacity)
  #   if capacity == 0 || weights.length == 0
  #     @knapsack[capacity] = [0]
  #   end

  #   i = weights.length - 1

  #   @knapsack[capacity] = [] if @knapsack[capacity].nil?

  #   return @knapsack[capacity][i] if @knapsack[capacity][i]

  #   prev = knapsack_table(weights[0...i], values[0...i], capacity)
  #   other = knapsack_table(weights[0...i], values[0...i], capacity - weights[i]) + values[i]
  #   return prev if weights[i] > capacity
  #   choices = [prev, other]
  #   max = choices.max
  #   @knapsack[capacity][i] = max
  #   max
  # end

  def maze_solver(maze, start_pos, end_pos)
    if start_pos == end_pos
      return [start_pos]
    elsif valid_moves(maze, start_pos).empty?
      @visited.push(start_pos)
      try_again = @queue.pop
      return maze_solver(maze, try_again, end_pos) if try_again 
      @queue = @visited.uniq
      return []
    end
    
    @visited.push(start_pos)
    @queue.push(start_pos)


    solution = []
    all_solutions = []

    next_moves = valid_moves(maze, start_pos)

    next_moves.each do |move|
      end_space = maze_solver(maze, move, end_pos)
      return (@queue + end_space).uniq
    end
  end

  # def maze_solver(maze, start_pos, end_pos)
  #   @table = Array.new(maze.length) { Array.new(maze[0].length, []) }

  #   height = maze.length
  #   width = maze[0].length
  #   moves = [[1,0],[0,1],[0,-1],[-1,0]]

  #   (width - 1).downto(0).each do |y_pos|
  #     (height - 1).downto(0).each do |x_pos|
  #       next unless in_bounds?(maze, [x_pos, y_pos])

  #       if [x_pos, y_pos] == end_pos 
  #         @table[x_pos][y_pos] = [end_pos]
  #       elsif !in_bounds?(maze, [x_pos, y_pos])
  #         @table[x_pos][y_pos] = nil
  #       else

  #         coord = maze[x_pos][y_pos]
  #         next_moves = moves.map {|move| [move[0] + x_pos, move[1] + y_pos] }

  #         next_moves = next_moves.select {|move| in_bounds?(maze, move)}

  #         prev_moves = next_moves.map do |move|
  #           x,y = move
          
  #           @table[x][y]
  #         end

  #         prev_moves = prev_moves.sort { |move| move.length }
  #         best_move = prev_moves[0]

  #         # @table[x_pos][y_pos].push([x_pos, y_pos]) if best_move.nil?
  #         @table[x_pos][y_pos] = best_move unless best_move.nil?

  #         @table[x_pos][y_pos].unshift([x_pos, y_pos])
  #       end
  #     end
  #   end
    
  #   debugger

  #   @table[start_pos[0]][start_pos[1]]
  # end

  private 

  def valid_moves(maze, pos)
    moves = [[-1,0],[0,1],[1,0],[0,-1]]

    next_moves = []
    moves = moves.map {|move| [move[0] + pos[0], move[1] + pos[1]] }
    
    moves.each do |move|
      next_moves.push(move) if in_bounds?(maze, move)
    end
    
    next_moves
  end

  def in_bounds?(maze, pos)
    in_bounds = pos[0] >= 0 && pos[1] >= 0 && pos[0] < maze.length && pos[1] < maze[0].length

    return false unless in_bounds

    not_wall = maze[pos[0]][pos[1]] != "X"

    not_visited = !@visited.include?(pos)

    return not_wall && not_visited
  end
end
