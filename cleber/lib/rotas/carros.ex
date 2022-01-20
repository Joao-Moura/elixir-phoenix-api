defmodule Rotas.Carros do
  import Plug.Conn
  use Plug.Router
  require Logger

  plug(Rotas.Cors)
  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  plug :dispatch

  post "/teste-post" do
    %Plug.Conn{body_params: coisas} = conn
    Logger.info(coisas)
    send_resp(conn, 201, "Poggers")
  end

  get "/teste-get/:com_param" do
    %Plug.Conn{params: %{"com_param" => coisas}} = conn
    Logger.info(coisas)
    send_resp(conn, 200, "Based")
  end
end
