class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0


    self.to_s.each_char.with_index do |el, i|
      num = el.ord + self.length
      num += (i + 1) * 3
      num.times do |times|
        hash += times ** 14
      end
    end

    hash % 1000000
  end
end

class String
  def hash
    hash = 1 
    
    self.split("").hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
   keys = self.keys.map { |el| el.to_s } 
   keys = keys.sort.hash
   vals = self.keys.map { |el| el.to_s } 
   vals = vals.sort.hash

   keys + vals
  end
end
