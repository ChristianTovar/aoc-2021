defmodule Aoc2021.Day02Test do
  use ExUnit.Case

  import Aoc2021.Day02

  setup_all do
    {:ok, input_string} = File.read("input/day_02.txt")

    input =
      input_string
      |> String.split()
      |> Enum.chunk_every(2)
      |> Enum.map(fn [direction, value] -> [direction, String.to_integer(value)] end)

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 1_893_605
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 2_120_734_350
    assert expected_result == part2(state.input)
  end
end
