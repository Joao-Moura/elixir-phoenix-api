defmodule Cleber do
  use Application

  def start(_type, _args) do
    children = [
      Database.Repo,
      {Phoenix.PubSub, name: Supervisor.PubSub},
      Supervisor.Telemetry,
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Rotas,
        options: [
          port: String.to_integer(System.get_env("PORT") || "4000"),
          # Caso queira fazer um dispatch custom
          # dispatch: dispatch(),
          protocol_options: [idle_timeout: :infinity]
        ]
      )
    ]

    opts = [strategy: :one_for_one, name: Cleber.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
