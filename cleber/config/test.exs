import Config

database_url =
  System.get_env("DATABASE_URL") ||
    "postgresql://elixir_pg:elixir_pg@localhost/elixir_pg_test"

config :cleber, Database.Repo,
  url: database_url,
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :error

config :cleber,
  secret_key_base:
    System.get_env("SECRET_KEY_BASE") ||
      raise("""
      environment variable SECRET_KEY_BASE is missing.
      """),
  api_url: System.get_env("API_URL") || "https://cleber.teste",
  access_token_secret:
    System.get_env("ACCESS_TOKEN_SECRET") ||
      raise("""
      environment variable ACCESS_TOKEN_SECRET is missing.
      type some random characters to create one
      """),
  refresh_token_secret:
    System.get_env("REFRESH_TOKEN_SECRET") ||
      raise("""
      environment variable REFRESH_TOKEN_SECRET is missing.
      type some random characters to create one
      """)
