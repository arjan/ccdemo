defmodule CcdemoTest do
  use ExUnit.Case

  import Ccdemo.Template, only: [execute_naive: 2, execute: 2]

  test "template engine" do
    assert "foo  bas" == render("foo {bar} bas")
    assert "hello Arjan"= render("hello {name}", %{name: "Arjan"})
  end

  defp render(tpl, vars \\ %{}) do
    execute(tpl, vars) |> IO.chardata_to_string
  end

  test "'naive mode' (string operations)" do
    assert "foo  bas" == execute_naive("foo {bar} bas", %{})
    assert "hello Arjan"= execute_naive("hello {name}", %{name: "Arjan"})
  end

end
