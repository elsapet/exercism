module BookKeeping
  VERSION = 1
end

class Grains
  def self.square(number)
    raise ArgumentError if number <= 0 || number > 64
    number -= 1
    2**number
  end

  def self.total
    (1..64).sum { |n| Grains.square(n) }
  end
end
