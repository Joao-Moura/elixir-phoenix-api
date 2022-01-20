defmodule Rotas do
  import Plug.Conn
  use Plug.Router
  require Logger

  alias Rotas.Carros

  plug(Rotas.Cors)
  plug :match
  plug :dispatch

  # Para configurar os routers em outro arquivo usar:
  # forward("/exemplo-teste", to: Modulo)
  forward("/carros", to: Carros)

  get "/ping" do
    Logger.info("Endpoint acessado :)")
    send_resp(conn, 200, "pong")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
