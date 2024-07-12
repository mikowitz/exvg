defmodule ExVG.Elements.Line do
  @moduledoc """
  Models a `<line>` document element
  """

  defstruct [:x1, :y1, :x2, :y2, :style]

  use ExVG.Element, attrs: [:x1, :y1, :x2, :y2]
end
