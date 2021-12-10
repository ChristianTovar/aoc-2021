defmodule Aoc2021.Day06 do
  def part1(input), do: simulate_growth(input, 80)

  def part2(input), do: simulate_growth(input, 256)

  defp simulate_growth(fishes, 0), do: Enum.count(fishes)

  defp simulate_growth(fishes, remaining_days) do
    moms_count = Enum.count(fishes, &(&1 == 0))

    fishes
    |> Enum.map(&(&1 - 1))
    |> Enum.map(&if(&1 == -1, do: 6, else: &1))
    |> add_babys(moms_count)
    |> simulate_growth(remaining_days - 1)
  end

  defp add_babys(fishes, 0), do: fishes
  defp add_babys(fishes, moms_count), do: add_babys([8 | fishes], moms_count - 1)
end
