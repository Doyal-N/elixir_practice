defmodule ElixirWcTest do
  use ExUnit.Case
  doctest ElixirWc

  test "greets the world" do
    assert ElixirWc.hello() == :world
  end
end
