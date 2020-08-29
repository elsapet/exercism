defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @simple_vowels "aeio"
  @complex_vowels "uyx"
  @pig_tail "ay"

  def translate(phrase) do
    String.split(phrase, " ", trim: true)
    |> Enum.map(fn word ->
      pig_latin_for(word)
    end)
    |> Enum.join(" ")
  end

  defp pig_latin_for(word) do
    <<first::binary-size(1), rest::binary>> = word

    cond do
      String.contains?(@simple_vowels, first) ->
        word <> @pig_tail

      String.contains?(@complex_vowels, first) ->
        next = String.first(rest)
        last = String.last(rest)

        cond do
          # handle qu- and cases like xr-, yt-, xb-
          (first == "u" && last == "q") || String.contains?(@simple_vowels, next) ->
            rest <> first <> @pig_tail

          true ->
            word <> @pig_tail
        end

      true ->
        pig_latin_for(rest <> first)
    end
  end
end
