defmodule ExVG.Elements.Ellipse do
  @moduledoc """
  Models a '<ellipse>' document element
  """

  use ExVG.Element, attrs: [:rx, :ry, :cx, :cy]
end
