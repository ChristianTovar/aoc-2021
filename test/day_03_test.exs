defmodule Aoc2021.Day03Test do
  use ExUnit.Case

  import Aoc2021.Day03

  setup_all do
    {:ok, input_string} = File.read("input/day_03.txt")

    input =
      input_string
      |> String.split()
      |> Enum.map(&String.graphemes(&1))

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 2_035_764
    assert expected_result == part1(state.input)
  end
end
