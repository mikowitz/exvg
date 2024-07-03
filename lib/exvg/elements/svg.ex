defmodule ExVG.Elements.Svg do
  @moduledoc """
  Models an `<svg>` document element
  """

  @derive {Inspect, only: [:height, :width, :x, :y, :viewBox]}
  @enforce_keys [:height, :width]
  defstruct [:height, :width, x: 0, y: 0, viewBox: "0 0 100 100", is_root: false]

  defimpl ExVG.ToSvg do
    @attrs ~w(height width x y viewBox)a
    def to_svg(%@for{} = svg) do
      attributes =
        @attrs
        |> Enum.map(fn a -> {a, Map.get(svg, a)} end)
        |> then(fn attrs ->
          if svg.is_root, do: attrs ++ [{"xmlns", "http://www.w3.org/2000/svg"}], else: attrs
        end)
        |> Enum.map_join(" ", fn {k, v} -> "#{k}=\"#{v}\"" end)

      [
        "<svg #{attributes}>",
        "</svg>"
      ]
      |> Enum.reject(&is_nil/1)
      |> Enum.join("\n")
    end
  end
end
