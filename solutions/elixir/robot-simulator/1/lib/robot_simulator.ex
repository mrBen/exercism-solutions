defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  defstruct [:direction, :position]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, {x, y} = position) when direction in [:north, :east, :south, :west] and is_number(x) and is_number(y) do
    %RobotSimulator{direction: direction, position: position}
  end
  def create(direction, _position) when direction in [:north, :east, :south, :west], do: {:error, "invalid position"}
  def create(_direction, _position), do: {:error, "invalid direction"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, ""), do: robot
  def simulate(%{direction: :north} = robot, "R" <> instructions), do: simulate(%{robot | direction: :east}, instructions)
  def simulate(%{direction: :east} = robot, "R" <> instructions), do: simulate(%{robot | direction: :south}, instructions)
  def simulate(%{direction: :south} = robot, "R" <> instructions), do: simulate(%{robot | direction: :west}, instructions)
  def simulate(%{direction: :west} = robot, "R" <> instructions), do: simulate(%{robot | direction: :north}, instructions)
  def simulate(%{direction: :north} = robot, "L" <> instructions), do: simulate(%{robot | direction: :west}, instructions)
  def simulate(%{direction: :east} = robot, "L" <> instructions), do: simulate(%{robot | direction: :north}, instructions)
  def simulate(%{direction: :south} = robot, "L" <> instructions), do: simulate(%{robot | direction: :east}, instructions)
  def simulate(%{direction: :west} = robot, "L" <> instructions), do: simulate(%{robot | direction: :south}, instructions)
  def simulate(%{direction: direction, position: {x, y}} = robot, "A" <> instructions) do
    position = case direction do
      :north -> {x, y + 1}
      :east -> {x + 1, y}
      :south -> {x, y - 1}
      :west -> {x - 1, y}
    end
    simulate(create(direction, position), instructions)
  end
  def simulate(robot, instructions), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`w
  """
  @spec direction(robot) :: direction()
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot) do
    robot.position
  end
end
