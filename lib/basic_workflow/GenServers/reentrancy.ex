defmodule Reentrancy do
  use GenServer

  ## Public API

  def run() do
    GenServer.cast(:basic_workflow_reentrancy, :run)
  end

  ## GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :basic_workflow_reentrancy)
  end

  def handle_cast(:run, state) do
    :ok = do_slow_things()
    {:noreply, state}
  end

  ## Implementation

  defp do_slow_things() do
    IO.puts("......  into do_slow_things ......")

    for count <- 1..30 do
      :timer.sleep(1000)
      IO.puts("...#{count}")
    end

    :ok
  end
end
