import Config

config :logger, level: :info

database_url =
  System.get_env("DATABASE_URL") ||
    "postgresql://elixir_pg:elixir_pg@localhost/elixir_pg"

config :cleber, Database.Repo, url: database_url

config :cleber,
  secret_key_base:
    System.get_env("SECRET_KEY_BASE") ||
      raise("""
      environment variable SECRET_KEY_BASE is missing.
      """),
  rabbit_url:
    System.get_env("RABBITMQ_URL") ||
      raise("""
      environment variable RABBITMQ_URL is missing.
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

# Configuração para usar Sentry
# config :sentry,
#   dsn:
#     System.get_env("SENTRY_DSN") || System.get_env("SENTRY_DNS") ||
#       raise("""
#       environment variable SENTRY_DSN is missing.
#       """),
#   environment_name: :prod,
#   enable_source_code_context: true,
#   root_source_code_path: File.cwd!(),
#   tags: %{
#     env: "production"
#   },
#   included_environments: [:prod]
