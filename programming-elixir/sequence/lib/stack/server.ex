defmodule Stack.Server do
  use GenServer

  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, current_stack) do
    {:reply, current_stack |> List.first(), current_stack |> List.delete_at(0)}
  end
end
