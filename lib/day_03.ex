defmodule Aoc2021.Day03 do
  def part1(input) do
    column_count = Enum.reduce(input, acc(), &count_row/2)
    {gamma_b, epsilon_b} = calculate_rates(column_count)
    {gamma, _} = Integer.parse(gamma_b, 2)
    {epsilon, _} = Integer.parse(epsilon_b, 2)

    gamma * epsilon
  end

  def part2(input) do
    {oxygen_rating, _} =
      input
      |> filter_ratings(0, :o2)
      |> Enum.join()
      |> Integer.parse(2)

    {co2_rating, _} =
      input
      |> filter_ratings(0, :co2)
      |> Enum.join()
      |> Integer.parse(2)

    oxygen_rating * co2_rating
  end

  defp filter_ratings(ratings, 12, _type), do: ratings
  defp filter_ratings([h | _t] = rating, _index, _type) when is_binary(h), do: rating

  defp filter_ratings(ratings, index, type) do
    counts = Enum.frequencies_by(ratings, &Enum.at(&1, index))
    filtered_ratings = filter_by(ratings, counts, index, type)

    filter_ratings(filtered_ratings, index + 1, type)
  end

  defp filter_by(ratings, %{"1" => one, "0" => zero}, index, :o2) when one >= zero,
    do: Enum.filter(ratings, &(Enum.at(&1, index) == "1"))

  defp filter_by(ratings, %{"1" => one, "0" => zero}, index, :o2) when one < zero,
    do: Enum.filter(ratings, &(Enum.at(&1, index) == "0"))

  defp filter_by(ratings, %{"1" => one, "0" => zero}, index, :co2) when one >= zero,
    do: Enum.filter(ratings, &(Enum.at(&1, index) == "0"))

  defp filter_by(ratings, %{"1" => one, "0" => zero}, index, :co2) when one < zero,
    do: Enum.filter(ratings, &(Enum.at(&1, index) == "1"))

  defp filter_by(ratings, _counts, _index, _type), do: hd(ratings)

  defp acc, do: Enum.into(0..11, %{}, fn k -> {k, %{"0" => 0, "1" => 0}} end)

  defp count_row(row, acc) do
    row
    |> Enum.with_index()
    |> Enum.reduce(acc, fn {bit, index}, acc ->
      Map.update(acc, index, :aoc, &Map.put(&1, bit, &1[bit] + 1))
    end)
  end

  defp calculate_rates(map), do: Enum.reduce(map, {"", ""}, &calculate(&1, &2))

  defp calculate({_col, %{"0" => zero, "1" => one}}, {gamma, epsilon}) when zero > one,
    do: {gamma <> "0", epsilon <> "1"}

  defp calculate({_col, %{"0" => zero, "1" => one}}, {gamma, epsilon}) when zero < one,
    do: {gamma <> "1", epsilon <> "0"}
end
