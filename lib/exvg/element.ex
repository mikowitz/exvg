defmodule ExVG.Element do
  @moduledoc """
  Shared functionality for SVG document elements
  """

  defmacro __using__(opts) do
    attrs = Keyword.get(opts, :attrs, [])

    quote do
      defimpl ExVG.ToSvg do
        @attrs unquote(attrs)
        def to_svg(%@for{style: style} = element) do
          name = Module.split(@for) |> List.last() |> String.downcase()

          # style = Enum.map(style || %{}, fn {k, v} -> {k, v} end)
          style =
            [:fill, :stroke]
            |> Enum.map(&{&1, Map.get(style || %{}, &1)})
            |> Enum.reject(fn {_k, v} -> is_nil(v) end)

          attributes =
            @attrs
            |> Enum.map(fn a -> {a, Map.get(element, a)} end)
            |> Kernel.++(style)
            |> Enum.map(&ExVG.Element.map_attribute/1)
            |> Enum.map_join(" ", fn {k, v} -> "#{k}=\"#{v}\"" end)
            |> then(&"<#{name} #{&1} />")
        end
      end
    end
  end

  @doc false
  def map_attribute({k, points}) when k == :points do
    {:points, Enum.map_join(points, " ", fn {x, y} -> "#{x},#{y}" end)}
  end

  def map_attribute({_, _} = attr), do: attr
end
