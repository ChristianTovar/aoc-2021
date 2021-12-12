defmodule Aoc2021.Day06Test do
  use ExUnit.Case

  import Aoc2021.Day06

  setup_all do
    {:ok, input_string} = File.read("input/day_06.txt")

    input =
      input_string
      |> String.replace(~r/[\n]/, "")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 350_605
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 1_592_778_185_024
    assert expected_result == part2(state.input)
  end
end
