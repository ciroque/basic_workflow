defmodule BW.Pipeline.DataSourceProducer do
  @moduledoc false

  use GenStage

  def start_link(seed) do
    GenStage.start_link(__MODULE__, seed, name: __MODULE__)
  end

  def init(seed) do
    {:producer, seed}
  end

  def handle_demand(demand, next_id) when demand > 0 do
    IO.puts("#{__MODULE__}::handle_demand @ #{Timex.now()}")

    records = GeneratingDataSource.call(%{criteria: %{ start: next_id, size: demand }})
    %{id: max_id} = records |> Enum.max_by(&{&1.id})
    {:noreply, records, max_id + 1}
  end
end
