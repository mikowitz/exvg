defmodule ExVG.Elements.Polygon do
  @moduledoc """
  Models a `<polygon>` document element
  """

  defstruct [:points]

  defimpl ExVG.ToSvg do
    def to_svg(%@for{points: points}) do
      points =
        points
        |> Enum.map_join(" ", fn {k, v} -> "#{k},#{v}" end)

      "<polygon points=\"#{points}\" />"
    end
  end
end
