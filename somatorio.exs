defmodule Recursion do
  def somatorio(_f, a, b) when a > b, do: 0

  def somatorio(f, a, b) do
    f.(a) + somatorio(f, a+1, b)
  end
end

ExUnit.start

defmodule SomatorioTest do
  use ExUnit.Case, async: false

  test "should return the sum of each number of (n*2) from 1 to 5" do
    double = fn n -> n * 2 end
    assert 30 == Recursion.somatorio(double, 1, 5)
  end
end
