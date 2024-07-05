defmodule ExVG.Elements.EllipseTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Ellipse

  test "to_svg" do
    circle = %Ellipse{ry: 40, rx: 20, cx: 30, cy: 100}

    assert ExVG.to_svg(circle) ==
             """
             <ellipse rx="20" ry="40" cx="30" cy="100" />
             """
             |> String.trim()
  end
end
