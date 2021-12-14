defmodule Aoc2021.Day09 do
  @row_size 100
  @top_left_corner 1
  @top_right_corner 100
  @bottom_left_corner 90001
  @bottom_right_corner 10000

  def part1({input_list, input_map}), do: check_for_low_point(input_list, input_map, [])

  defp check_for_low_point([], _input_map, acc), do: Enum.sum(acc)

  # top left corner
  defp check_for_low_point([{1, value}, {2, next_value} | t], input_map, acc) do
    bottom = input_map[@top_left_corner + @row_size]

    check_if_lower(value, [bottom, next_value], t, input_map, acc)
  end

  # top right corner
  defp check_for_low_point([{@top_right_corner, value} | t], input_map, acc) do
    left = input_map[@top_right_corner - 1]
    bottom = input_map[@top_right_corner + @row_size]

    check_if_lower(value, [left, bottom], t, input_map, acc)
  end

  # between top corners
  defp check_for_low_point([{index, value} | t], input_map, acc)
       when index > @top_left_corner and index < @top_right_corner do
    left = input_map[index - 1]
    right = input_map[index + 1]
    bottom = input_map[index + @row_size]

    check_if_lower(value, [left, right, bottom], t, input_map, acc)
  end

  # between top right corner and bottom left corner (left column)
  defp check_for_low_point([{index, value} | t], input_map, acc)
       when index > @top_right_corner and index < @bottom_left_corner and
              rem(index, @row_size) == 1 do
    top = input_map[index - @row_size]
    right = input_map[index + 1]
    bottom = input_map[index + @row_size]

    check_if_lower(value, [top, right, bottom], t, input_map, acc)
  end

  # between top right corner and bottom left corner (right column)
  defp check_for_low_point([{index, value} | t], input_map, acc)
       when index > @top_right_corner and index < @bottom_left_corner and
              rem(index, @row_size) == 0 do
    top = input_map[index - @row_size]
    left = input_map[index - 1]
    bottom = input_map[index + @row_size]

    check_if_lower(value, [top, left, bottom], t, input_map, acc)
  end

  # between top right corner and bottom left corner (middle values)
  defp check_for_low_point([{index, value} | t], input_map, acc)
       when index > @top_right_corner and index < @bottom_left_corner do
    top = input_map[index - @row_size]
    bottom = input_map[index + @row_size]
    left = input_map[index - 1]
    right = input_map[index + 1]

    check_if_lower(value, [top, bottom, left, right], t, input_map, acc)
  end

  # bottom left corner
  defp check_for_low_point([{@bottom_left_corner, value} | t], input_map, acc) do
    top = input_map[@bottom_left_corner - @row_size]
    right = input_map[@bottom_left_corner + 1]

    check_if_lower(value, [top, right], t, input_map, acc)
  end

  # bottom right corner
  defp check_for_low_point([{@bottom_right_corner, value} | t], input_map, acc) do
    top = input_map[@bottom_left_corner - @row_size]
    left = input_map[@bottom_left_corner - 1]

    check_if_lower(value, [top, left], t, input_map, acc)
  end

  # between bottom corners
  defp check_for_low_point([{index, value} | t], input_map, acc)
       when index > @bottom_left_corner and index < @bottom_right_corner do
    left = input_map[index - 1]
    right = input_map[index + 1]
    top = input_map[index - @row_size]

    check_if_lower(value, [left, right, top], t, input_map, acc)
  end

  defp check_if_lower(value, neighbors, input_list, input_map, acc) do
    if Enum.all?(neighbors, &(&1 > value)),
      do: check_for_low_point(input_list, input_map, [value + 1 | acc]),
      else: check_for_low_point(input_list, input_map, acc)
  end
end
