defmodule Aoc2021.Day10 do
  @scores %{")" => 3, "]" => 57, "}" => 1197, ">" => 25137}

  def part1(input) do
    input
    |> Enum.reduce([], fn row, acc -> [check_row(row, []) | acc] end)
    |> Enum.reject(&(&1 == :ok))
    |> Enum.map(&@scores[&1])
    |> Enum.sum()
  end

  defp check_row([], _acc), do: :ok
  defp check_row([h | t], acc) when h in ~w([ {  ( <), do: check_row(t, [h | acc])
  defp check_row(["}" | t1], ["{" | t2]), do: check_row(t1, t2)
  defp check_row([")" | t1], ["(" | t2]), do: check_row(t1, t2)
  defp check_row([">" | t1], ["<" | t2]), do: check_row(t1, t2)
  defp check_row(["]" | t1], ["[" | t2]), do: check_row(t1, t2)
  defp check_row([h | _t], _acc), do: h
end
