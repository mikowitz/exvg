defmodule ExVG.Elements.Ellipse do
  @moduledoc """
  Models a '<ellipse>' document element
  """

  defstruct [:rx, :ry, :cx, :cy, :style]

  use ExVG.Element, attrs: [:rx, :ry, :cx, :cy]
end
