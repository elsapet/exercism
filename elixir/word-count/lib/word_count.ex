defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @word_regex ~r/[^\p{L}\p{N}\-]/

  def count(sentence) do
    String.downcase(sentence)
    |> String.split(@word_regex, trim: true)
    |> Enum.reduce(%{}, fn word, acc -> update_word_tally(word, acc) end)
  end

  defp update_word_tally(word, tally) do
    tally |> Map.update(word, 1, &(&1 + 1))
  end
end
