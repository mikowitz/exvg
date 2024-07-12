defmodule ExVG do
  @moduledoc """
  ExVG is a pure Elixir library for programatically creating SVG images.
  """

  defdelegate to_svg(element), to: ExVG.ToSvg

  def style(element, styling) do
    struct(ExVG.Style, styling)
    |> then(fn style ->
      %{element | style: style}
    end)
  end
end
