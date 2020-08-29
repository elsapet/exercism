defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  def rotate(text, shift) do
    to_charlist(text)
    |> Enum.map(fn c -> shift_char(c, shift) end)
    |> to_string
  end

  defp shift_char(char, shift) do
    shifted_char = char + shift

    cond do
      char in 65..90 ->
        case shifted_char > 90 do
          true -> 65 + (shifted_char - 91)
          false -> shifted_char
        end

      char in 97..122 ->
        case shifted_char > 122 do
          true -> 97 + (shifted_char - 123)
          false -> shifted_char
        end

      true ->
        char
    end
  end
end
