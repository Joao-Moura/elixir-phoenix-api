import Config

config :logger, level: :info

database_url =
  System.get_env("DATABASE_URL") ||
    "postgresql://elixir_pg:elixir_pg@localhost/elixir_pg"

config :cleber, Database.Repo, url: database_url

config :cleber,
  api_url: System.get_env("API_URL") || "http://localhost:4000",
  secret_key_base:
    "213lo12j3kl21j3kl21alaksjdklasjdklajsldjsaldjlasdlaksjdklasjdklajsldjsaldjlasdlaksjdklasjdklajsldjsaldjlasdadjlasjddlkijoqwijdoqwjd12loki3jhl12jelk12jekl1221099dj120",
  env: :dev,
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
