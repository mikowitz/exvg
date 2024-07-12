defmodule ExVG.Elements.Rect do
  @moduledoc """
  Models a '<rect>' document element
  """

  defstruct [:width, :height, :style, x: 0, y: 0, rx: :auto, ry: :auto, pathLength: :none]

  use ExVG.Element, attrs: [:width, :height, :x, :y, :rx, :ry, :pathLength]
end
