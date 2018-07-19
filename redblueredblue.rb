def  wordpattern( pattern,  input) 
    uniques = pattern.split("").uniq 

    # create an input hash for the pattern lengths and also for the different strings that are assigned to each character in the pattern
    inputs_length_hash = num_patterns(pattern, input.length)
    inputs_string_hash = Hash.new { |k,v| k[v] = ""}
     

    # based on the different pattern:length combinations returned in `num_patterns` I will create a hashmap that assigns a letter to a string of the length determined by `input_length_hash`
    inputs_length_hash.each do |arr|
        i = 0
        pattern.chars.each_with_index do |letter, index|
            # we can replace repeats in the pattern, because they should be equal anyway.  This is kind of expensive, and there is perhaps another way to accomplish the same thing
            length = arr[uniques.index(letter)]
            inputs_string_hash[letter] = input[i...i + length]
            i += length 
        end

        # maps each letter to the string length

        result = pattern.split("").map { |key| inputs_string_hash[key] }

        p result
        
        return 1 if result.join("") == input
    end

    return 0
end


# calculates all the combinations of lengths for each character in the patter
def num_patterns(input, num, count = 0)
    # if input is "bb", we want to return, but we also need to keep track of how many b's are in the pattern.
    count += 1
    p count
    uniques = input.split("").uniq
    return [[num / input.length]] if uniques.length == 1
    
    solution = []

    # recursively remove the first letter and assign a length to it
    char = input[0]
    next_string = input.delete(char)

    # calculate how long the first character can be based on how many times it appears in the pattern and how many characters total are in the pattern
    max_length = num - next_string.length
    num_char = input.count(char)

    # get the results from all the other characters recursively
    (1..max_length / num_char).each do |leng|
        next_pattern = num_patterns(next_string, num - leng * num_char, count)
        next_pattern.each do |arr|
            solution.push([leng] + arr)
        end
    end
    
    return solution
end
