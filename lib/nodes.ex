defmodule Nodes do
  @moduledoc """
  Documentation for `Nodes`.
  """

  @doc """
  Function for reverse lists.

  ## Examples

      iex> Nodes.reverse([10, 20, 30, 1])
      [1, 30, 20, 10]

      iex> Nodes.reverse([])
      []
  """
  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])
  defp do_reverse([], acc), do: acc
  defp do_reverse([h | t], acc), do: do_reverse(t, [h | acc])
end
