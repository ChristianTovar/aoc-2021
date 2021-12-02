defmodule Aoc2021.Day02 do
  defstruct horizontal: 0, depth: 0, aim: 0

  def part1(input), do: calculate_course(input, %__MODULE__{})

  def part2(input), do: calculate_real_course(input, %__MODULE__{})

  defp calculate_course([], acc), do: acc.horizontal * acc.depth

  defp calculate_course([["forward", value] | t], acc),
    do: calculate_course(t, %{acc | horizontal: acc.horizontal + value})

  defp calculate_course([["up", value] | t], acc),
    do: calculate_course(t, %{acc | depth: acc.depth - value})

  defp calculate_course([["down", value] | t], acc),
    do: calculate_course(t, %{acc | depth: acc.depth + value})

  defp calculate_real_course([], acc), do: acc.horizontal * acc.depth

  defp calculate_real_course([["forward", value] | t], acc),
    do:
      calculate_real_course(t, %{
        acc
        | horizontal: acc.horizontal + value,
          depth: acc.depth + acc.aim * value
      })

  defp calculate_real_course([["up", value] | t], acc),
    do: calculate_real_course(t, %{acc | aim: acc.aim - value})

  defp calculate_real_course([["down", value] | t], acc),
    do: calculate_real_course(t, %{acc | aim: acc.aim + value})
end
