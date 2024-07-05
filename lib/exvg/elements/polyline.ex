defmodule ExVG.Elements.Polyline do
  @moduledoc """
  Models a `<polyline>` document element
  """

  defstruct [:points]

  defimpl ExVG.ToSvg do
    def to_svg(%@for{points: points}) do
      points =
        points
        |> Enum.map_join(" ", fn {k, v} -> "#{k},#{v}" end)

      "<polyline points=\"#{points}\" />"
    end
  end
end
