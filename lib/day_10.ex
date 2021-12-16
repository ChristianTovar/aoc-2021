defmodule Aoc2021.Day10 do
  @scores_1 %{")" => 3, "]" => 57, "}" => 1197, ">" => 25137}
  @scores_2 %{"(" => 1, "[" => 2, "{" => 3, "<" => 4}

  def part1(input) do
    input
    |> Enum.reduce([], fn row, acc -> [check_row(row, []) | acc] end)
    |> Enum.reject(&(&1 == :ok))
    |> Enum.map(&@scores_1[&1])
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> Enum.reduce([], fn row, acc -> [check_row(row, []) | acc] end)
    |> Enum.reverse()
    |> Enum.zip(input)
    |> Enum.filter(fn {indicator, _row} -> indicator == :ok end)
    |> Enum.map(fn {_indicator, row} -> complete_row(row, []) end)
    |> Enum.map(&Enum.reduce(&1, 0, fn char, acc -> acc * 5 + @scores_2[char] end))
    |> Enum.sort()
    |> get_middle_value()
  end

  defp check_row([], _acc), do: :ok
  defp check_row([h | t], acc) when h in ~w([ {  ( <), do: check_row(t, [h | acc])
  defp check_row(["}" | t1], ["{" | t2]), do: check_row(t1, t2)
  defp check_row([")" | t1], ["(" | t2]), do: check_row(t1, t2)
  defp check_row([">" | t1], ["<" | t2]), do: check_row(t1, t2)
  defp check_row(["]" | t1], ["[" | t2]), do: check_row(t1, t2)
  defp check_row([h | _t], _acc), do: h

  defp complete_row([], acc), do: acc
  defp complete_row([h | t], acc) when h in ~w([ {  ( <), do: complete_row(t, [h | acc])
  defp complete_row(["}" | t1], ["{" | t2]), do: complete_row(t1, t2)
  defp complete_row([")" | t1], ["(" | t2]), do: complete_row(t1, t2)
  defp complete_row([">" | t1], ["<" | t2]), do: complete_row(t1, t2)
  defp complete_row(["]" | t1], ["[" | t2]), do: complete_row(t1, t2)
  defp complete_row(["{" | t], acc), do: complete_row(t, ["}" | acc])
  defp complete_row(["(" | t], acc), do: complete_row(t, [")" | acc])
  defp complete_row(["<" | t], acc), do: complete_row(t, [">" | acc])
  defp complete_row(["[" | t], acc), do: complete_row(t, ["]" | acc])
  defp complete_row([_h | t], acc), do: complete_row(t, acc)

  defp get_middle_value(values) do
    middle =
      values
      |> Enum.count()
      |> div(2)

    Enum.at(values, middle)
  end
end
