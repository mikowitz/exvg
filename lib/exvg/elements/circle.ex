defmodule ExVG.Elements.Circle do
  @moduledoc """
  Models a '<circle>' document element
  """

  defstruct [:r, :cx, :cy]

  use ExVG.Element, attrs: [:r, :cx, :cy]
end
