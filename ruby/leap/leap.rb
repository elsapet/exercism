class Year

  VERSION = 1 

  def self.leap? year
    return year % 400 == 0 if year % 100 == 0
    year % 4 == 0
  end

end