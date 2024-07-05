defmodule ExVG.Elements.PolylineTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Polyline

  test "to_svg" do
    polyline = %Polyline{
      points: [
        {10, 20},
        {20, 40},
        {30, 80},
        {100, 40}
      ]
    }

    assert ExVG.to_svg(polyline) ==
             """
             <polyline points="10,20 20,40 30,80 100,40" />
             """
             |> String.trim()
  end
end
