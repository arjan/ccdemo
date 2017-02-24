defmodule Ccdemo.Template do
  use CompilerCache

  @moduledoc """
  A basic template engine

  Takes strings like "foo {var} bar" and interpolates all `{var}`
  occurrences with the input in the map.

  """

  @var_regex ~r/({\w+})/


  def create_ast(template) do
    ast = Regex.split(@var_regex, template, include_captures: true)
    |> Enum.map(fn
      ("{" <> rest) ->
        var = String.trim_trailing(rest, "}") |> String.to_atom
        quote do
          Map.get(unquote(Macro.var(:input, nil)), unquote(var), "")
        end
      (literal) -> literal
    end)

    {ast, []}
  end

  @doc """
  Mimic the template engine by using string operations. Only used for
  benchmarking purposes.
  """
  def execute_naive(template, vars) do
    rendered =
      Enum.reduce(vars, template, fn({var, value}, template) ->
        pattern = "{#{var}}"
        template |> String.replace(pattern, value)
      end)
    # Remove leftover {..}
    Regex.replace(@var_regex, rendered, "")
  end

end
