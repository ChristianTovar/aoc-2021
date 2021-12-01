defmodule Aoc2021.Day01Test do
  use ExUnit.Case

  import Aoc2021.Day01

  setup_all do
    {:ok, input_string} = File.read("input/day_01.txt")

    input =
      input_string
      |> String.split()
      |> Enum.map(&String.to_integer(&1))

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 1475
    assert expected_result == part1(state.input)
  end
end
