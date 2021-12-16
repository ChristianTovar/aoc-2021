defmodule Aoc2021.Day10Test do
  use ExUnit.Case

  import Aoc2021.Day10

  setup_all do
    {:ok, input_string} = File.read("input/day_10.txt")

    input =
      input_string
      |> String.split()
      |> Enum.map(&String.graphemes/1)

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 392_043
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 1_605_968_119
    assert expected_result == part2(state.input)
  end
end
