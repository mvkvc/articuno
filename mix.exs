defmodule Articuno.MixProject do
  use Mix.Project

  @source_url "https://github.com/mvkvc/articuno"
  @version "0.1.0"

  def project do
    [
      app: :articuno,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Articuno.Application, []}
    ]
  end

  defp docs do
    [
      extras: [{:"README.md", [title: "Overview"]}],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.6"},
      {:httpoison, "~> 2.0"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      docs: ["docs --formatter html"]
    ]
  end
end
