# require 'byebug'
# def  wordpattern( pattern,  input) 
#     distinct_inputs = pattern.split("")
#     distinct_inputs = distinct_inputs.uniq 
#     inputs_length_hash = Hash.new { |k,v| k[v] = 0}
#     inputs_string_hash = Hash.new { |k,v| k[v] = ""}
    
#     distinct_inputs.each do |input|
#         inputs_length_hash[input] = 1 
#     end
    
    
#     total_input_length = inputs_length_hash.values.reduce(:+)

#     inputs_length_hash.each do |k,v|
#         starting_num = 1
    
#         while total_input_length <= input.length
#             i = 0

#             pattern.chars.each do |char| 
#                 mapped_input_length = starting_num
#                 inputs_string_hash[char] = input[i...i + mapped_input_length]
#                 i += mapped_input_length
#             end 
            
#             result = pattern.split("").map {|key| inputs_string_hash[key] }

#             return 1 if result.join("") == input

#             num_pattern = pattern.count(k)

#             starting_num += num_pattern

#             total_input_length = i + num_pattern
#         end
#     end
        
#     return 0
# end

def  wordpattern(pattern,  input) 

end

def num_patterns(string, num)
    return 
end
