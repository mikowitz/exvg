defmodule ExVG.Elements.Line do
  @moduledoc """
  Models a `<line>` document element
  """

  defstruct [:x1, :y1, :x2, :y2]

  defimpl ExVG.ToSvg do
    @attrs ~w(x1 y1 x2 y2)a
    def to_svg(%@for{} = line) do
      attributes =
        @attrs
        |> Enum.map(fn a -> {a, Map.get(line, a)} end)
        |> Enum.map_join(" ", fn {k, v} -> "#{k}=\"#{v}\"" end)

      "<line #{attributes} />"
    end
  end
end
