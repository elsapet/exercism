defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    cond do
      number > 1 ->
        remaining = if number - 1 > 1, do: "#{number - 1} bottles", else: "1 bottle"

        "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" <>
          "Take one down and pass it around, #{remaining} of beer on the wall.\n"

      number > 0 ->
        "#{number} bottle of beer on the wall, #{number} bottle of beer.\n" <>
          "Take it down and pass it around, no more bottles of beer on the wall.\n"

      true ->
        "No more bottles of beer on the wall, no more bottles of beer.\n" <>
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range |> Enum.map(&verse(&1)) |> Enum.join("\n")
  end
end
