defmodule ExVG.Document do
  @moduledoc """
  Models an SVG image document.
  """
  alias ExVG.Elements.Svg

  defstruct [:root]

  def new(width, height) do
    %__MODULE__{
      root: %Svg{width: width, height: height, is_root: true}
    }
  end

  defimpl ExVG.ToSvg do
    def to_svg(%@for{root: root}), do: @protocol.to_svg(root)
  end
end
