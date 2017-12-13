defmodule GeneratingDataSource do
  @moduledoc false

  @behaviour DataSourceBehaviour
  def call(%{criteria: %{ start: start, size: size }}) do
    Enum.to_list(start .. start + size - 1)
    |> Enum.map(fn i -> %{id: i} end)
  end
end
