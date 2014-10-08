defmodule Hub.Mixfile do
  use Mix.Project

  def project do
    [ app: :hub,
      version: "0.0.1",
      elixir: "~> 1.0.0",
      elixirc_paths: ["lib", "web"],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { Hub, [] },
      applications: [:phoenix, :cowboy, :logger, :httpoison]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:amrita, "~>0.4", github: "josephwilk/amrita"},
      {:phoenix, "0.4.1"},
      {:httpoison, "~> 0.4"},
      {:urna, "~> 0.1"}
    ]
  end
end
