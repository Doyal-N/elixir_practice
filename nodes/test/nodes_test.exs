defmodule NodesTest do
  use ExUnit.Case
  doctest Nodes

  test "big list" do
    assert Nodes.reverse(Enum.to_list(1..1_000_000)) == Enum.to_list(1_000_000..1)
  end

  test "list of lists is not flattened" do
    assert Nodes.reverse([[1, 2], [3], [], [4, 5, 6]]) == [[4, 5, 6], [], [3], [1, 2]]
  end
end
