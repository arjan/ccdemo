defmodule TemplateBench do
  use Benchfella

  alias Ccdemo.Template


  @small_template "Hello, {name}, welcome on the {language} meetup."
  @small_vars %{name: "Arjan", language: "Elixir"}

  @large_template "Hello, {name}, welcome on the {language} meetup. " |> String.duplicate(50)
  @large_vars %{name: "Arjan", language: "Elixir"}


  setup_all do
    Application.ensure_all_started(:ccdemo)
    # # cache warming
    # Template.execute(@small_template, @small_vars)
    # Template.execute(@large_template, @large_vars)
    # :timer.sleep 1000
    {:ok, []}
  end

  bench "small template - string ops" do
    Template.execute_naive(@small_template, @small_vars)
  end

  bench "small template - compiler cache" do
    Template.execute(@small_template, @small_vars)
  end

  bench "large template - string ops" do
    Template.execute_naive(@large_template, @large_vars)
  end

  bench "large template - compiler cache" do
    Template.execute(@large_template, @large_vars)
  end

end
