defmodule Aoc2021.Day04Test do
  use ExUnit.Case

  import Aoc2021.Day04

  setup_all do
    {:ok, input_string} = File.read("input/day_04.txt")
    [string_numbers | boards] = String.split(input_string)

    numbers =
      string_numbers
      |> String.split(~r/,/)
      |> Enum.map(&String.to_integer/1)

    boards_list =
      boards
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(25)

    {:ok, input: {numbers, boards_list}}
  end

  test "part1", state do
    expected_result = 8136
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 12738
    assert expected_result == part2(state.input)
  end
end
