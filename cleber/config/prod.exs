import Config

# Configuração para Sentry
# config :logger, level: :info, backends: [:console, Sentry.LoggerBackend]

config :logger, level: :info
config :cleber, env: :prod
