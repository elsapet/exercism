defmodule ResistorColor do
  @moduledoc false

  @resistor_colors [
    {"black", 0},
    {"brown", 1},
    {"red", 2},
    {"orange", 3},
    {"yellow", 4},
    {"green", 5},
    {"blue", 6},
    {"violet", 7},
    {"grey", 8},
    {"white", 9}
  ]

  def colors do
    @resistor_colors |> Enum.map(fn {color, _} -> color end)
  end

  def code(color) do
    {_, band_number} =
      @resistor_colors
      |> Enum.find({"", -1}, fn {resistor_color, _} ->
        resistor_color == String.downcase(color)
      end)

    band_number
  end
end
