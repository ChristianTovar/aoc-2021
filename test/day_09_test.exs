defmodule Aoc2021.Day09Test do
  use ExUnit.Case

  import Aoc2021.Day09

  setup_all do
    {:ok, input_string} = File.read("input/day_09.txt")

    input_list =
      input_string
      |> String.split()
      |> Enum.map(&String.graphemes/1)
      |> Enum.map(&Enum.map(&1, fn x -> String.to_integer(x) end))
      |> List.flatten()
      |> Enum.with_index()
      |> Enum.map(fn {value, index} -> {index + 1, value} end)

    {:ok, input: {input_list, Map.new(input_list)}}
  end

  test "part1", state do
    expected_result = 500
    assert expected_result == part1(state.input)
  end
end
