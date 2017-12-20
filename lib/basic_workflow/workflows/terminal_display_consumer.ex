defmodule BW.Pipeline.TerminalDisplayConsumer do
  @moduledoc false
  
  use GenStage

  def start_link() do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
#    {:consumer, :nothing, subscribe_to: [PersistenceProducerConsumer]}
    {:consumer, :nothing}
  end

  def handle_events(events, from, state) do
    Process.sleep(1000)
    IO.puts("#{__MODULE__}::handle_events @ #{Timex.now()} #{inspect(from)}")

    events
    |> Enum.map(
      fn m ->
        IO.puts("--> #{m.timestamp}")
      end)

    {:noreply, [], state}
  end
end
