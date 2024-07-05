defmodule ExVG.Elements.PolygonTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Polygon

  test "to_svg" do
    polygon = %Polygon{
      points: [
        {10, 20},
        {20, 40},
        {30, 80},
        {100, 40}
      ]
    }

    assert ExVG.to_svg(polygon) ==
             """
             <polygon points="10,20 20,40 30,80 100,40" />
             """
             |> String.trim()
  end
end
