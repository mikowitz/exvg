defmodule ExVG.Elements.Polygon do
  @moduledoc """
  Models a `<polygon>` document element
  """

  use ExVG.Element, attrs: [:points]
end
