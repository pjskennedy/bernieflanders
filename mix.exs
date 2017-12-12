defmodule Bernieflanders.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bernieflanders,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :extwitter]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 1.5", runtime: false},
      {:oauther, "~> 1.1"},
      {:extwitter, "~> 0.8"}
    ]
  end
end
