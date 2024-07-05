defmodule ExVG.Elements.RectTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Rect

  test "to_svg" do
    rect = %Rect{width: 20, height: 30, x: 10, rx: 5}

    assert ExVG.to_svg(rect) ==
             """
             <rect width="20" height="30" x="10" y="0" rx="5" ry="auto" pathLength="none" />
             """
             |> String.trim()
  end
end
