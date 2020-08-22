defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @roman_numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  def numeral(number) do
    to_roman(number, "")
  end

  defp to_roman(number, string) do
    case @roman_numerals |> Enum.find(fn {digit, _} -> digit <= number end) do
      {digit, roman_numeral} -> to_roman(number - digit, "#{string}#{roman_numeral}")
      nil -> string
    end
  end
end
