defmodule BW.Pipeline.PersistenceProducerConsumer do
  @moduledoc false

  use GenStage

  def start_link(records) do
    GenStage.start_link(__MODULE__, records, name: __MODULE__)
  end

  def init(records) do
#    {:producer_consumer, records, subscribe_to: [DataSourceProducer] }
    {:producer_consumer, records}
  end

  def handle_events(events, from, records) do
    IO.puts("#{__MODULE__}::handle_events @ #{Timex.now()} % #{inspect(from)}")

    events = events
    |> Enum.map(
      fn m ->
        Map.put_new(m, :timestamp, Timex.now())
      end)

    {:noreply, events, records}
  end
end
