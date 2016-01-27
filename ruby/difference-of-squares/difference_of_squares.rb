class Squares

  VERSION = 1 

  def initialize n
    @n = n
  end

  def difference
    square_of_sums - sum_of_squares
  end
  
  def square_of_sums
    sum = (1..@n).reduce(:+)
    sum**2
  end

  def sum_of_squares
    (1..@n).inject { |sum, n| sum + n**2 }
  end

end