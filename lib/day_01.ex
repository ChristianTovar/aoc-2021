defmodule Aoc2021.Day01 do
  @spec part1([integer()], integer()) :: pos_integer()
  def part1(input, acc \\ 0), do: count_measurement_increases(input, acc)

  defp count_measurement_increases([], acc), do: acc

  defp count_measurement_increases([a, b | t], acc) when a < b,
    do: count_measurement_increases([b | t], acc + 1)

  defp count_measurement_increases([_h | t], acc),
    do: count_measurement_increases(t, acc)
end
