defmodule Hexadecimal do
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex
    |> String.downcase
    |> String.reverse
    |> String.codepoints
    |> _to_decimal 1

  end

  defp _to_decimal([], _mult), do: 0
  defp _to_decimal(list, mult) do # when list contains only hex digits
    [head|tail] = list
    _to_decimal(head)*mult + _to_decimal(tail, mult*16)
  end
  defp _to_decimal(_list, _mult), do: 0

  defp _to_decimal("0"), do: 0
  defp _to_decimal("1"), do: 1
  defp _to_decimal("2"), do: 2
  defp _to_decimal("3"), do: 3
  defp _to_decimal("4"), do: 4
  defp _to_decimal("5"), do: 5
  defp _to_decimal("6"), do: 6
  defp _to_decimal("7"), do: 7
  defp _to_decimal("8"), do: 8
  defp _to_decimal("9"), do: 9
  defp _to_decimal("a"), do: 10
  defp _to_decimal("b"), do: 11
  defp _to_decimal("c"), do: 12
  defp _to_decimal("d"), do: 13
  defp _to_decimal("e"), do: 14
  defp _to_decimal("f"), do: 15
  defp _to_decimal(_a), do: 0
end
