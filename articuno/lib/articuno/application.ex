defmodule Articuno.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Articuno.Router, options: [port: 3000]}
    ]

    opts = [strategy: :one_for_one, name: Articuno.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
