defmodule ArticunoTest do
  use ExUnit.Case
  doctest Articuno

  test "greets the world" do
    assert Articuno.hello() == :world
  end
end
