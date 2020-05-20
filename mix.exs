defmodule PhxUi.MixProject do
  use Mix.Project

  def project do
    [
      app: :phx_ui,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: "Library containing UI components",
      compilers: [:phoenix] ++ Mix.compilers(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Lukas Hambsch"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/lukashambsch/phx_ui"}
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.5.0"},
      {:phoenix_html, "~> 2.14.1"},
      {:phoenix_live_view, github: "phoenixframework/phoenix_live_view"}
    ]
  end
end
