defmodule ExVG.DocumentTest do
  use ExUnit.Case, async: true

  alias ExVG.Document

  test "ToSvg" do
    document = Document.new(150, 200)

    assert ExVG.to_svg(document) ==
             """
             <svg height="200" width="150" x="0" y="0" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
             </svg>
             """
             |> String.trim()
  end
end
