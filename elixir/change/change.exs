defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(_amount, []), do: :error
  def generate(amount, coins) do
    if Enum.min(coins) > amount do
      :error
    else
      desc_coins = coins
                   |> Enum.sort
                   |> Enum.reverse
      results = Map.new(coins, fn x -> {x,0} end)
      {:ok, _subtract(amount, desc_coins, results)}
    end
  end

  defp _subtract(0, _, results), do: results
  defp _subtract(amount, desc_coins, results) do
    # find the largest coin in values that is smaller than amount
    coin = Enum.find desc_coins,0, fn x -> x <= amount end
      # add it ro result
    if coin == 0 do
      results
    else
      {_, new_results} = Map.get_and_update! results, coin, fn x -> {x,x + 1} end

      returned_results = _subtract(amount - coin, desc_coins, new_results)
      # call _subtract with new amount, values, and new result
      returned_results
    end
  end
end
