defmodule UnlessMacro do
  defmacro unless(clause, do: expression) do
    quote do
      if (!unquote(clause)) do
        unquote(expression)
      end
    end
  end
end

ExUnit.start

defmodule UnlessMacroTest do
  use ExUnit.Case
  require UnlessMacro

  test "execute block unless clause is evaluate to false" do
    return = UnlessMacro.unless false do ; 'exec block' ; end
    assert 'exec block' == return
  end
end
