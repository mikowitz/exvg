defmodule ExVG.Elements.CircleTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Circle

  test "to_svg" do
    circle = %Circle{r: 20, cx: 30, cy: 100}

    assert ExVG.to_svg(circle) ==
             """
             <circle r="20" cx="30" cy="100" />
             """
             |> String.trim()
  end
end
