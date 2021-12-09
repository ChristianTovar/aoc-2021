defmodule Aoc2021.Day05Test do
  use ExUnit.Case

  import Aoc2021.Day05

  setup_all do
    {:ok, input_string} = File.read("input/day_05.txt")

    input =
      input_string
      |> String.replace(~r/[->]/, "")
      |> String.split()
      |> Enum.map(&String.split(&1, ","))
      |> List.flatten()
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(4)
      |> Enum.map(&List.to_tuple/1)

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 6113
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 20373
    assert expected_result == part2(state.input)
  end
end
