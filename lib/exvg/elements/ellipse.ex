defmodule ExVG.Elements.Ellipse do
  @moduledoc """
  Models a '<ellipse>' document element
  """

  defstruct [:rx, :ry, :cx, :cy]

  defimpl ExVG.ToSvg do
    @attrs ~w(rx ry cx cy)a
    def to_svg(%@for{} = ellipse) do
      attributes =
        @attrs
        |> Enum.map(fn a -> {a, Map.get(ellipse, a)} end)
        |> Enum.map_join(" ", fn {k, v} -> "#{k}=\"#{v}\"" end)

      "<ellipse #{attributes} />"
    end
  end
end
