defmodule ExVG.Elements.Circle do
  @moduledoc """
  Models a '<circle>' document element
  """

  use ExVG.Element, attrs: [:r, :cx, :cy]
end
