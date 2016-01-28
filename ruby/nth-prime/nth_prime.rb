class Prime

  def self.nth n
    raise ArgumentError if n < 1
    count = 0
    num = 1
    while count < n
      num += 1
      count += 1 if is_prime num
    end
    num
  end

  def self.is_prime num
    return num == 2 if num%2 == 0
    return num == 3 if num%3 == 0

    (5..(Math.sqrt(num).to_i)).each do |i|
      return false if num%i == 0
    end
    true
  end

end