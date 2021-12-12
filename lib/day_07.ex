defmodule Aoc2021.Day07 do
  def part1(input) do
    size = Enum.count(input)
    separating_position = median(size)

    median =
      input
      |> Enum.sort()
      |> Enum.at(separating_position)

    input
    |> Enum.map(&abs(&1 - median))
    |> Enum.sum()
  end

  def part2(input) do
    size = Enum.count(input)

    average =
      input
      |> Enum.sum()
      |> div(size)

    input
    |> Enum.map(&Enum.sum(1..abs(&1 - average)))
    |> Enum.sum()
  end

  defp median(size) when rem(size, 2) == 0, do: div(size, 2)
  defp median(size), do: div(size + 1, 2)
end
