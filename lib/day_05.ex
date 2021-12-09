defmodule Aoc2021.Day05 do
  def part1(input) do
    input
    |> Enum.filter(&ignore_diagonals/1)
    |> count_overlaps()
  end

  def part2(input), do: count_overlaps(input)

  defp count_overlaps(coordinates) do
    coordinates
    |> Enum.map(&set_lines/1)
    |> store_coordinates()
    |> Map.values()
    |> Enum.map(&Map.values/1)
    |> Enum.map(&Enum.filter(&1, fn val -> val > 1 end))
    |> List.flatten()
    |> Enum.count()
  end

  defp ignore_diagonals({x, _y1, x, _y2}), do: true
  defp ignore_diagonals({_x1, y, _x2, y}), do: true
  defp ignore_diagonals(_), do: false

  defp set_lines({x, y1, x, y2}), do: for(y <- y1..y2, do: {x, y})
  defp set_lines({x1, y, x2, y}), do: for(x <- x1..x2, do: {x, y})
  defp set_lines({x1, y1, x2, y2}), do: for({x, y} <- Enum.zip(x1..x2, y1..y2), do: {x, y})

  defp store_coordinates(coordinates_list) do
    Enum.reduce(coordinates_list, %{}, fn coordinates_line, map ->
      Enum.reduce(coordinates_line, map, fn {x, y}, acc ->
        Map.update(acc, x, %{y => 1}, fn sub_coordinate_map ->
          Map.update(sub_coordinate_map, y, 1, &(&1 + 1))
        end)
      end)
    end)
  end
end
