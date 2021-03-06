defmodule Ccdemo.Mixfile do
  use Mix.Project

  def project do
    [app: :ccdemo,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      mod: {Ccdemo, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:compiler_cache, "~> 1.0", runtime: false},
      {:benchfella, "~> 0.3.0", only: :dev}
    ]
  end
end
