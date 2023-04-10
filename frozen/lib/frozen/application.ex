defmodule Frozen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Frozen.Repo,
      # Start the Telemetry supervisor
      FrozenWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Frozen.PubSub},
      # Start the Endpoint (http/https)
      FrozenWeb.Endpoint
      # Start a worker by calling: Frozen.Worker.start_link(arg)
      # {Frozen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Frozen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FrozenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
