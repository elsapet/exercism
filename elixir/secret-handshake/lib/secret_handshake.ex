use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @operations ["wink", "double blink", "close your eyes", "jump"]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> build_command_list(Bitwise.band(code, 0b1) > 0, 0)
    |> build_command_list(Bitwise.band(code, 0b10) > 0, 1)
    |> build_command_list(Bitwise.band(code, 0b100) > 0, 2)
    |> build_command_list(Bitwise.band(code, 0b1000) > 0, 3)
    |> handle_list_reversal(Bitwise.band(code, 0b10000) > 0)
  end

  defp build_command_list(acc, true, index) do
    [Enum.at(@operations, index) | acc]
  end

  defp build_command_list(acc, _, _) do
    acc
  end

  defp handle_list_reversal(acc, false) do
    Enum.reverse(acc)
  end

  defp handle_list_reversal(acc, _) do
    # don't reverse
    acc
  end
end
