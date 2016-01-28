class Robot

  attr_accessor :name

  def initialize
    @name = random_name
  end

  def reset
    @name = random_name
  end

  def random_name
    "#{(65 + rand(0..25)).chr}#{(65 + rand(0..25)).chr}#{rand(100..999)}"
  end

end