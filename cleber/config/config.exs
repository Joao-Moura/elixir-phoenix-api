import Config

config :cleber, ecto_repos: [Database.Repo]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
