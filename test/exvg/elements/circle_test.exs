defmodule ExVG.Elements.CircleTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Circle

  describe "to_svg" do
    test "basic" do
      circle = %Circle{r: 20, cx: 30, cy: 100}

      assert ExVG.to_svg(circle) ==
               """
               <circle r="20" cx="30" cy="100" />
               """
               |> String.trim()
    end

    test "styled" do
      circle =
        %Circle{r: 20, cx: 30, cy: 100}
        |> ExVG.style(fill: "blue", stroke: "red")

      assert ExVG.to_svg(circle) ==
               """
               <circle r="20" cx="30" cy="100" fill="blue" stroke="red" />
               """
               |> String.trim()
    end
  end
end
