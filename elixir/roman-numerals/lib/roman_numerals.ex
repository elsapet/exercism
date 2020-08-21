defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @roman_numerals %{
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def numeral(number) do
    to_roman(number, "")
  end

  defp to_roman(number, string) do
    cond do
      1000 <= number ->
        to_roman(number - 1000, "#{string}#{@roman_numerals[1000]}")

      900 <= number ->
        to_roman(number - 900, "#{string}#{@roman_numerals[900]}")

      500 <= number ->
        to_roman(number - 500, "#{string}#{@roman_numerals[500]}")

      400 <= number ->
        to_roman(number - 400, "#{string}#{@roman_numerals[400]}")

      100 <= number ->
        to_roman(number - 100, "#{string}#{@roman_numerals[100]}")

      90 <= number ->
        to_roman(number - 90, "#{string}#{@roman_numerals[90]}")

      50 <= number ->
        to_roman(number - 50, "#{string}#{@roman_numerals[50]}")

      40 <= number ->
        to_roman(number - 40, "#{string}#{@roman_numerals[40]}")

      10 <= number ->
        to_roman(number - 10, "#{string}#{@roman_numerals[10]}")

      9 <= number ->
        to_roman(number - 9, "#{string}#{@roman_numerals[9]}")

      5 <= number ->
        to_roman(number - 5, "#{string}#{@roman_numerals[5]}")

      4 <= number ->
        to_roman(number - 4, "#{string}#{@roman_numerals[4]}")

      1 <= number ->
        to_roman(number - 1, "#{string}#{@roman_numerals[1]}")

      0 == number ->
        string
    end
  end
end
