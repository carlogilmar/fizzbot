defmodule ElixirFizz.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_fizz,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.0", override: true},
      {:poison, "~> 3.1"}
    ]
  end
end
