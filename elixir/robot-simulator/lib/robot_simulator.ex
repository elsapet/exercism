defmodule RobotSimulator do
  @turn_right %{
    :north => :east,
    :east => :south,
    :south => :west,
    :west => :north
  }

  @turn_left %{
    :north => :west,
    :east => :north,
    :south => :east,
    :west => :south
  }

  @advance %{
    :north => {0, 1},
    :east => {1, 0},
    :south => {0, -1},
    :west => {-1, 0}
  }
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

  # LAAARALA

  def simulate(robot, "") do
    robot
  end

  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.graphemes()
    |> Enum.reduce_while(robot, fn
      "R", robot -> {:cont, %{robot | direction: Map.fetch!(@turn_right, direction(robot))}}
      "L", robot -> {:cont, %{robot | direction: Map.fetch!(@turn_left, direction(robot))}}
      "A", robot -> {:cont, advance(robot)}
      _, _robot -> {:halt, {:error, "invalid instruction"}}
    end)
  end

  defp advance(robot) do
    {old_x, old_y} = position(robot)
    {delta_x, delta_y} = Map.fetch!(@advance, direction(robot))
    %{robot | position: {old_x + delta_x, old_y + delta_y}}
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
end
