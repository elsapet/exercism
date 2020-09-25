defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(_direction \\ :north, _position \\ {0, 0})

  def create(direction, _position) when not (direction in [:north, :east, :south, :west]) do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y}) when is_integer(x) and is_integer(y) do
    %{
      direction: direction,
      position: {x, y}
    }
  end

  def create(_direction, _position) do
    {:error, "invalid position"}
  end

  def simulate(robot, "") do
    robot
  end

  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.graphemes()
    |> Enum.reduce_while(robot, fn
      "R", robot -> {:cont, turn(robot, :right)}
      "L", robot -> {:cont, turn(robot, :left)}
      "A", robot -> {:cont, advance(robot)}
      _, _ -> {:halt, {:error, "invalid instruction"}}
    end)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:position]
  end

  defp turn(robot, :right) do
    %{
      robot
      | direction:
          Map.fetch!(
            %{
              :north => :east,
              :east => :south,
              :south => :west,
              :west => :north
            },
            direction(robot)
          )
    }
  end

  defp turn(robot, :left) do
    %{
      robot
      | direction:
          Map.fetch!(
            %{
              :north => :west,
              :east => :north,
              :south => :east,
              :west => :south
            },
            direction(robot)
          )
    }
  end

  defp advance(robot) do
    {old_x, old_y} = position(robot)

    {delta_x, delta_y} =
      Map.fetch!(
        %{
          :north => {0, 1},
          :east => {1, 0},
          :south => {0, -1},
          :west => {-1, 0}
        },
        direction(robot)
      )

    %{robot | position: {old_x + delta_x, old_y + delta_y}}
  end
end
