defmodule Rotas do
  # import Plug.Conn
  use Plug.Router
  require Logger

  plug :match
  plug :dispatch

  # Para configurar os routers em outro arquivo usar:
  # forward("/exemplo-teste", to: Modulo)

  get "/" do
    Logger.info("Endpoint acessado :)")
    send_resp(conn, 200, "teste")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
