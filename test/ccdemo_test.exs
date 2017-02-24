defmodule CcdemoTest do
  use ExUnit.Case

  alias Ccdemo.Template
  import Ccdemo.Template, only: [render_direct: 2]

  test "template engine" do
    assert "foo  bas" == render("foo {bar} bas")
    assert "hello Arjan"= render("hello {name}", %{name: "Arjan"})
  end

  defp render(tpl, vars \\ %{}) do
    Template.execute(tpl, vars) |> IO.chardata_to_string
  end


  test "'direct mode' (unaccellerated)" do
    assert "foo  bas" == render_direct("foo {bar} bas", %{})
    assert "hello Arjan"= render_direct("hello {name}", %{name: "Arjan"})
  end


end
