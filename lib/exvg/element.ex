defmodule ExVG.Element do
  @moduledoc """
  Shared functionality for SVG document elements
  """

  defmacro __using__(opts) do
    {attrs, attrs_with_defaults} =
      Keyword.get(opts, :attrs, [])
      |> Enum.split_with(&is_atom/1)

    all_attr_keys = attrs ++ Enum.map(attrs_with_defaults, &elem(&1, 0))

    quote do
      defstruct [unquote_splicing(attrs), :style, unquote_splicing(attrs_with_defaults)]

      defimpl ExVG.ToSvg do
        @attrs unquote(all_attr_keys)
        def to_svg(%@for{} = element) do
          name = Module.split(@for) |> List.last() |> String.downcase()

          attributes =
            @attrs
            |> Enum.map(fn a -> {a, Map.get(element, a)} end)
            |> Kernel.++(style_attributes(element))
            |> Enum.map(&ExVG.Element.map_attribute/1)
            |> Enum.map_join(" ", fn {k, v} -> "#{k}=\"#{v}\"" end)
            |> then(&"<#{name} #{&1} />")
        end

        defp style_attributes(%@for{style: style}) do
          [:fill, :stroke]
          |> Enum.map(&{&1, Map.get(style || %{}, &1)})
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
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
