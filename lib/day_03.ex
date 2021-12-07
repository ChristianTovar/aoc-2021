defmodule Aoc2021.Day03 do
  def part1(input) do
    column_count = Enum.reduce(input, acc(), &count_row/2)
    {gamma_b, epsilon_b} = calculate_rates(column_count)
    {gamma, _} = Integer.parse(gamma_b, 2)
    {epsilon, _} = Integer.parse(epsilon_b, 2)

    gamma * epsilon
  end

  defp acc, do: Enum.into(0..11, %{}, fn k -> {k, %{"0" => 0, "1" => 0}} end)

  defp count_row(row, acc) do
    row
    |> Enum.with_index()
    |> Enum.reduce(acc, fn {bit, index}, acc ->
      Map.update(acc, index, :aoc, &Map.put(&1, bit, &1[bit] + 1))
    end)
  end

  defp calculate_rates(map), do: Enum.reduce(map, {"", ""}, &calculate(&1, &2))

  defp calculate({_col, %{"0" => zero, "1" => one}}, {gamma, epsilon}) when zero > one,
    do: {gamma <> "0", epsilon <> "1"}

  defp calculate({_col, %{"0" => zero, "1" => one}}, {gamma, epsilon}) when zero < one,
    do: {gamma <> "1", epsilon <> "0"}
end
