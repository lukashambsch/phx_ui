defmodule PhxUiTest do
  use ExUnit.Case
  doctest PhxUi

  test "greets the world" do
    assert PhxUi.hello() == :world
  end
end
