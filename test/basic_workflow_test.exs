defmodule BasicWorkflowTest do
  use ExUnit.Case
  doctest BasicWorkflow

  test "greets the world" do
    assert BasicWorkflow.hello() == :world
  end
end
