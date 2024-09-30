defmodule Ch25Backend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Ch25BackendWeb.Telemetry,
      Ch25Backend.Repo,
      {DNSCluster, query: Application.get_env(:ch25_backend, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ch25Backend.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Ch25Backend.Finch},
      # Start a worker by calling: Ch25Backend.Worker.start_link(arg)
      # {Ch25Backend.Worker, arg},
      # Start to serve requests, typically the last entry
      Ch25BackendWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ch25Backend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Ch25BackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
