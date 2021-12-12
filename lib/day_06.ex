defmodule Aoc2021.Day06 do
  def part1(input) do
    input
    |> count_fishes()
    |> simulate_growth(80)
  end

  def part2(input) do
    input
    |> count_fishes()
    |> simulate_growth(256)
  end

  defp count_fishes(input), do: Enum.reduce(input, %{}, &Map.update(&2, &1, 1, fn x -> x + 1 end))

  defp simulate_growth(fishes, 0) do
    fishes
    |> Map.values()
    |> Enum.sum()
  end

  defp simulate_growth(fishes, remaining_days) do
    0..7
    |> Enum.reduce(%{}, fn num, acc -> Map.put(acc, num, fishes[num + 1] || 0) end)
    |> Map.put(8, fishes[0] || 0)
    |> Map.put(0, fishes[1] || 0)
    |> Map.update(6, 0, &(&1 + (fishes[0] || 0)))
    |> simulate_growth(remaining_days - 1)
  end
end
