defmodule ExVG do
  @moduledoc """
  ExVG is a pure Elixir library for programatically creating SVG images.
  """

  defdelegate to_svg(element), to: ExVG.ToSvg
end
