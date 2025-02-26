defmodule ExVG.Elements.Polygon do
  @moduledoc """
  Models a `<polygon>` document element
  """

  defstruct [:points]

  use ExVG.Element, attrs: [:points]
end
