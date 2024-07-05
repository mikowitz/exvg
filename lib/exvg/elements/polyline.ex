defmodule ExVG.Elements.Polyline do
  @moduledoc """
  Models a `<polyline>` document element
  """

  defstruct [:points]

  use ExVG.Element, attrs: [:points]
end
