defmodule SimplePlugStatic.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       scheme: :http, plug: {Plug.Static, at: "/", from: "assets"}, options: [port: 3000]}
    ]

    opts = [strategy: :one_for_one, name: SimplePlugStatic.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
