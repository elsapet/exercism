class Fixnum

  VERSION = 1

  ROMAN_MAP = {
    1000 => "M",
    900  => "CM",
    500  => "D",
    400  => "CD",
    100  => "C",
    90   => "XC",
    50   => "L",
    40   => "XL",
    10   => "X",
    9    => "IX",
    5    => "V",
    4    => "IV",
    1    => "I"
  }


  def to_roman
    roman_string = ""
    number = self
    ROMAN_MAP.each do |arabic_num, roman|
      while number >= arabic_num
        number -= arabic_num
        roman_string.concat roman
      end
    end
    roman_string
  end

end
