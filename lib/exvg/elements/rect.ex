defmodule ExVG.Elements.Rect do
  @moduledoc """
  Models a '<rect>' document element
  """

  defstruct [:width, :height, x: 0, y: 0, rx: :auto, ry: :auto, pathLength: :none]

  defimpl ExVG.ToSvg do
    @attrs ~w(width height x y rx ry pathLength)a
    def to_svg(%@for{} = rect) do
      attributes =
        @attrs
        |> Enum.map(fn a -> {a, Map.get(rect, a)} end)
        |> Enum.map_join(" ", fn {k, v} -> "#{k}=\"#{v}\"" end)

      "<rect #{attributes} />"
    end
  end
end
