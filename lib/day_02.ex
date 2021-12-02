defmodule Aoc2021.Day02 do
  defstruct horizontal: 0, depth: 0

  def part1(input), do: calculate_course(input, %__MODULE__{})

  defp calculate_course([], acc), do: acc.horizontal * acc.depth

  defp calculate_course([["forward", value] | t], %{horizontal: current} = acc),
    do: calculate_course(t, %{acc | horizontal: current + value})

  defp calculate_course([["up", value] | t], %{depth: current} = acc),
    do: calculate_course(t, %{acc | depth: current - value})

  defp calculate_course([["down", value] | t], %{depth: current} = acc),
    do: calculate_course(t, %{acc | depth: current + value})
end
