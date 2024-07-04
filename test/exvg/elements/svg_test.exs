defmodule ExVG.Elements.SvgTest do
  use ExUnit.Case, async: true

  alias ExVG.Elements.Svg

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
  end
end
