defmodule Aoc2021.Day04 do
  def part1({numbers, boards}), do: play_bingo(numbers, boards)

  def part2({numbers, boards}), do: play_fake_bingo(numbers, boards)

  defp play_bingo(_, bingo) when is_number(bingo), do: bingo

  defp play_bingo([number | t], boards) do
    updated_boards = draw_number(boards, [], number)

    play_bingo(t, updated_boards)
  end

  defp play_fake_bingo(_, bingo) when is_number(bingo), do: bingo

  defp play_fake_bingo([number | t], boards) do
    updated_boards = draw_last_number(boards, [], number)

    play_fake_bingo(t, updated_boards)
  end

  defp draw_last_number([], updated_boards, _), do: Enum.reverse(updated_boards)

  defp draw_last_number([board | t], acc, number) do
    with updated_board <- remove_number(board, number),
         :ok <- check_rows(updated_board),
         :ok <- check_columns(updated_board) do
      draw_last_number(t, [updated_board | acc], number)
    else
      winner_board ->
        check_winner(t, acc, number, winner_board)
    end
  end

  defp check_winner([], [], number, winner_board),
    do: number * Enum.sum(Enum.reject(winner_board, &is_nil(&1)))

  defp check_winner(t, acc, number, _winner_board), do: draw_last_number(t, acc, number)

  defp draw_number([], updated_boards, _), do: Enum.reverse(updated_boards)

  defp draw_number([board | t], acc, number) do
    with updated_board <- remove_number(board, number),
         :ok <- check_rows(updated_board),
         :ok <- check_columns(updated_board) do
      draw_number(t, [updated_board | acc], number)
    else
      winner_board ->
        number * Enum.sum(Enum.reject(winner_board, &is_nil(&1)))
    end
  end

  defp remove_number(board, number), do: Enum.map(board, &if(&1 == number, do: nil, else: &1))

  defp check_rows(board) do
    if check_for_winner_row(board) == :bingo, do: board, else: :ok
  end

  defp check_for_winner_row([]), do: :ok
  defp check_for_winner_row([nil, nil, nil, nil, nil | _t]), do: :bingo
  defp check_for_winner_row([_h | t]), do: check_rows(t)

  defp check_columns(board) do
    0..4
    |> Enum.map(&check_column(board, &1))
    |> Enum.member?(:bingo)
    |> case do
      true -> board
      false -> :ok
    end
  end

  defp check_column(board, column_number) do
    column =
      board
      |> Enum.drop(column_number)
      |> Enum.take_every(5)

    if column == [nil, nil, nil, nil, nil], do: :bingo
  end
end
