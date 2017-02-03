defmodule Roman do
  @doc """
  Convert the number to a roman number.
  I = 1
  V = 5
  X = 10
  L = 50
  C = 100
  D = 500
  M = 1000
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    List.to_string _numerals(number)
  end

  defp _numerals(1),    do: 'I'
  defp _numerals(4),    do: 'IV'
  defp _numerals(5),    do: 'V'
  defp _numerals(9),    do: 'IX'
  defp _numerals(10),   do: 'X'
  defp _numerals(40),   do: 'XL'
  defp _numerals(50),   do: 'L'
  defp _numerals(90),   do: 'XC'
  defp _numerals(100),  do: 'C'
  defp _numerals(400),  do: 'CD'
  defp _numerals(500),  do: 'D'
  defp _numerals(900),  do: 'CM'
  defp _numerals(1000), do: 'M'


  defp _numerals(number) do
    cond do
      number > 1000 -> _numerals(1000) ++ _numerals(number - 1000)
      number >  900 -> _numerals( 900)  ++ _numerals(number - 900)
      number >  500 -> _numerals( 500)  ++ _numerals(number - 500)
      number >  400 -> _numerals( 400)  ++ _numerals(number - 400)
      number >  100 -> _numerals( 100)  ++ _numerals(number - 100)
      number >   90 -> _numerals(  90)  ++ _numerals(number -  90)
      number >   50 -> _numerals(  50)  ++ _numerals(number -  50)
      number >   40 -> _numerals(  40)  ++ _numerals(number -  40)
      number >   10 -> _numerals(  10)  ++ _numerals(number -  10)
      number >    9 -> _numerals(   9)  ++ _numerals(number -   9)
      number >    5 -> _numerals(   5)  ++ _numerals(number -   5)
      number >    2 -> _numerals(   2)  ++ _numerals(number -   2)
      number >    1 -> _numerals(   1)  ++ _numerals(number -   1)
    end
  end
end
