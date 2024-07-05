defmodule ExVG.Elements.Circle do
  @moduledoc """
  Models a '<circle/>' document element
  """

  defstruct [:r, :cx, :cy]

  defimpl ExVG.ToSvg do
    @attrs ~w(r cx cy)a
    def to_svg(%@for{} = rect) do
      attributes =
        @attrs
        |> Enum.map(fn a -> {a, Map.get(rect, a)} end)
        |> Enum.map_join(" ", fn {k, v} -> "#{k}=\"#{v}\"" end)

      "<circle #{attributes} />"
    end
  end
end
