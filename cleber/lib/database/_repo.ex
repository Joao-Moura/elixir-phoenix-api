defmodule Cleber.Repo do
  use Ecto.Repo,
    otp_app: :cleber,
    adapter: Ecto.Adapters.Postgres
end
