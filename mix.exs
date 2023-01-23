defmodule Hare.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hare,
      version: "0.2.2",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "Some abstractions to interact with a AMQP broker (SaleMove fork)",
      package: package(),
      deps: deps(),
      dialyzer: [
        flags: [:error_handling],
        plt_add_apps: [:amqp]
      ]
    ]
  end

  def application do
    [applications: [:logger, :connection]]
  end

  defp deps do
    [
      {:amqp, "~> 3.0"},
      {:connection, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :salemove_hare,
      maintainers: ["SaleMove team"],
      licenses: ["Apache 2"],
      links: %{"GitHub" => "https://github.com/salemove/hare"}
    ]
  end
end
