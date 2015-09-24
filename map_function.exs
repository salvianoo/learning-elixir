defmodule Functions do
  def mep([], _f), do: []

  def mep([h | t], f) do
    [ f.(h) | mep(t, f) ]
  end
end

ExUnit.start

defmodule FunctionsTest do
  use ExUnit.Case, async: false

  test "should return an empty array" do
    assert [] == Functions.mep [], fn e -> e end
  end

  test "should return the same array" do
    ary = [1,2,3]
    assert ary == Functions.mep ary, fn e -> e end
  end
end
