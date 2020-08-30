defmodule Bob do
  @bob_responses %{
    :question => "Sure.",
    :shouting => "Whoa, chill out!",
    :shouted_question => "Calm down, I know what I'm doing!",
    :silence => "Fine. Be that way!",
    :default => "Whatever."
  }

  def hey(input) do
    formatted_input = input |> String.trim()

    cond do
      silence?(formatted_input) ->
        @bob_responses[:silence]

      question?(formatted_input) && shouted?(formatted_input) ->
        @bob_responses[:shouted_question]

      question?(formatted_input) ->
        @bob_responses[:question]

      shouted?(formatted_input) ->
        @bob_responses[:shouting]

      true ->
        @bob_responses[:default]
    end
  end

  defp question?(input) do
    input |> String.ends_with?("?")
  end

  defp shouted?(input) do
    # eliminate number- and punctuation-only strings
    input |> String.capitalize() != input && input |> String.downcase() != input &&
      input |> String.upcase() == input
  end

  defp silence?(input) do
    input |> String.length() == 0
  end
end
