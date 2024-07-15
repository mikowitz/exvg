defmodule ExVG.Elements.Rect do
  @moduledoc """
  Models a '<rect>' document element
  """

  use ExVG.Element, attrs: [:width, :height, x: 0, y: 0, rx: :auto, ry: :auto, pathLength: :none]
end
