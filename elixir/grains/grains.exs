defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(1), do: 1
  def square(number) do
    values = _calc([1], number)
    List.last values
  end

  defp _calc(values, number) do
    if length(values) < number do
      last = List.last values
      new = last * 2
      _calc(values ++ [new],number)
    else
      values
    end
  end
  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    Enum.sum _calc([1], 64)

  end
end
