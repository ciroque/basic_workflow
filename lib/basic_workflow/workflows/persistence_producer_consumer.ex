defmodule PersistenceProducerConsumer do
  @moduledoc false

  use GenStage

  def start_link(records) do
    GenStage.start_link(PersistenceProducerConsumer, records)
  end

  def init(records) do
    {:producer_consumer, records}
  end

  def handle_events(events, _from, records) do
    IO.puts("#{__MODULE__}::handle_events => events = #{inspect(events)}, records = #{inspect(records)}")
    {:noreply, events, records}
  end

end
