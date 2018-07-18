require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
  hash = HashMap.new
  string.chars do |char|
    unless hash.include?(char)
        hash.set(char, 1)
    else 
        hash.delete(char) if hash.include?(char)
    end
  end

  return hash.count <= 1
end
