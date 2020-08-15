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
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    reversed_list = []

    reversed_list =
      case Bitwise.band(code, 0b1) > 0 do
        true -> ["wink" | reversed_list]
        _ -> reversed_list
      end

    reversed_list =
      case Bitwise.band(code, 0b10) > 0 do
        true -> ["double blink" | reversed_list]
        _ -> reversed_list
      end

    reversed_list =
      case Bitwise.band(code, 0b100) > 0 do
        true -> ["close your eyes" | reversed_list]
        _ -> reversed_list
      end

    reversed_list =
      case Bitwise.band(code, 0b1000) > 0 do
        true -> ["jump" | reversed_list]
        _ -> reversed_list
      end

    reversed_list =
      case Bitwise.band(code, 0b10000) > 0 do
        false -> Enum.reverse(reversed_list)
        _ -> reversed_list
      end

    reversed_list
  end
end
