defmodule TweetsFilterElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tweets_filter_elixir,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :extwitter, :gen_stage],
      mod: {TweetsFilterElixir.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gen_stage, "~> 0.13.0"},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.0"},
      {:extwitter, "~> 0.9.1"},
      {:hackney, "~> 1.10"}
    ]
  end
end
