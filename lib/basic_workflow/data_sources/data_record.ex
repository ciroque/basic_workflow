defmodule DataRecord do
  @moduledoc false

  @type t :: %__MODULE__{
    id: integer
  }

  defstruct [
    :id
  ]
end
