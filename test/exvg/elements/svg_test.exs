defmodule ExVG.Elements.SvgTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.{Rect, Svg}

  describe "to_svg" do
    test "when it is not the root element" do
      svg = %Svg{width: 100, height: 200}

      assert ExVG.to_svg(svg) ==
               """
               <svg height="200" width="100" x="0" y="0" viewBox="0 0 100 100">
               </svg>
               """
               |> String.trim()
    end

    test "when it is the root element" do
      svg = %Svg{width: 100, height: 200, is_root: true}

      assert ExVG.to_svg(svg) ==
               """
               <svg height="200" width="100" x="0" y="0" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
               </svg>
               """
               |> String.trim()
    end

    test "when the element has child elements" do
      svg = %Svg{
        width: 100,
        height: 200,
        children: [
          %Rect{width: 50, height: 100, y: 30}
        ]
      }

      assert ExVG.to_svg(svg) ==
               """
               <svg height="200" width="100" x="0" y="0" viewBox="0 0 100 100">
                 <rect width="50" height="100" x="0" y="30" rx="auto" ry="auto" pathLength="none" />
               </svg>
               """
               |> String.trim()
    end
  end
end
