defmodule Supervisor.Telemetry do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do
    :timer.send_interval(10_000, self(), :coletar_metricas)
    {:ok, %{}}
  end

  def handle_info(:coletar_metricas, state) do
    Logger.info("Telemetria chamada, usando logger")
    {:noreply, state}
  end
end
