defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  def rotate(text, shift) do
    to_charlist(text)
    |> Enum.map(&shift_char(&1, shift))
    |> to_string
  end

  defp shift_char(char, shift) do
    shifted_char = char + shift

    cond do
      char in ?a..?z ->
        wraparound_shift(shifted_char, ?a, ?z)

      char in ?A..?Z ->
        wraparound_shift(shifted_char, ?A, ?Z)

      true ->
        char
    end
  end

  defp wraparound_shift(shifted_char, initial, limit) do
    case shifted_char > limit do
      true -> initial + shifted_char - (limit + 1)
      false -> shifted_char
    end
  end
end
