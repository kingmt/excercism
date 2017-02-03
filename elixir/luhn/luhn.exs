defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.reverse
    |> String.codepoints
    |> _checksum 1
  end
  defp _checksum([],_), do: 0
  defp _checksum(list, 1) do
    [head|tail] = list
    String.to_integer(head) + _checksum(tail,2)
  end
  defp _checksum(list, 2) do
    [head|tail] = list
    _double(String.to_integer(head)) + _checksum(tail,1)
  end
  defp _double(x) when x < 5 do
    x*2
  end
  defp _double(x) when x > 4 do
    x*2-9
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    c = checksum number
    rem(c,10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    checksummed = checksum "#{number}0"
    check_digit = rem(checksummed,10)
    if check_digit == 0 do
      "#{number}0"
    else
      "#{number}#{10-check_digit}"
    end
  end
end
