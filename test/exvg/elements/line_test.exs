defmodule ExVG.Elements.LineTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Line

  test "to_svg" do
    line = %Line{x1: 10, x2: 20, y1: 10, y2: 85}

    assert ExVG.to_svg(line) ==
             """
             <line x1="10" y1="10" x2="20" y2="85" />
             """
             |> String.trim()
  end
end
