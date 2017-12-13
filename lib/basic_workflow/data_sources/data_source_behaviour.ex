defmodule DataSourceBehaviour do
  @moduledoc false

  @type data_record_t::DataRecord.t
  @type criteria_t::%{criteria: any}

  @callback call(criteria_t) :: {:ok, list(data_record_t)} | {:error, map}
end
