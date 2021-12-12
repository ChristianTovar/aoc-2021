defmodule Aoc2021.Day07Test do
  use ExUnit.Case

  import Aoc2021.Day07

  setup_all do
    {:ok, input_string} = File.read("input/day_07.txt")

    input =
      input_string
      |> String.replace(~r/[\n]/, "")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 336_040
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 94_813_675
    assert expected_result == part2(state.input)
  end
end
