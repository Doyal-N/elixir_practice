defmodule ElixirWc do
  import File, only: [stream!: 1]

  @spec lines_count(binary()) :: non_neg_integer()
  def lines_count(path) do
    stream!(path)
    |> Flow.from_enumerable()
    |> Flow.map(&String.trim/1)
    |> Flow.filter(fn line -> line != "\n" end)
    |> Flow.partition()
    |> Enum.count()
  end

  @spec words_count(binary()) :: non_neg_integer()
  def words_count(path) do
    stream!(path)
    |> Flow.from_enumerable()
    |> Flow.map(&word_count/1)
    |> Flow.partition()
    |> Enum.sum()
  end

  @spec chars_count(binary()) :: non_neg_integer()
  def chars_count(path) do
    stream!(path)
    |> Flow.from_enumerable()
    |> Flow.map(&char_count/1)
    |> Flow.partition()
    |> Enum.sum()
  end

  defp word_count(str) do
    str
    |> String.split()
    |> Enum.count()
  end

  defp char_count(str) do
    str
    |> String.trim()
    |> String.graphemes()
    |> Enum.reduce(0, &unless(&1 == " ", do: &2 + 1, else: &2))
  end
end

  # Улучшить:
  #  считать строки, слова и символы в одном проходе;
  #  аккуратнее с пробелами.
