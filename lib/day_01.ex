defmodule Aoc2021.Day01 do
  @spec part1([integer()], integer()) :: pos_integer()
  def part1(input, acc \\ 0), do: count_single_increases(input, acc)

  @spec part2([integer()], integer()) :: pos_integer()
  def part2(input, acc \\ 0), do: count_triple_increases(input, acc)

  defp count_single_increases([], acc), do: acc

  defp count_single_increases([a, b | t], acc) when a < b,
    do: count_single_increases([b | t], acc + 1)

  defp count_single_increases([_ | t], acc),
    do: count_single_increases(t, acc)

  defp count_triple_increases([_, _, _], acc), do: acc

  defp count_triple_increases([a, b, c, d | t], acc) when a + b + c < b + c + d,
    do: count_triple_increases([b, c, d | t], acc + 1)

  defp count_triple_increases([_ | t], acc), do: count_triple_increases(t, acc)
end
