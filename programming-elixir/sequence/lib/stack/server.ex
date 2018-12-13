defmodule Stack.Server do
  use GenServer

  @server Stack.Server

  # API part
  def start_link(stack) do
    GenServer.start_link(@server, stack, name: @server)
  end

  def pop do
    GenServer.call(@server, :pop)
  end

  def push(item) do
    GenServer.cast(@server, {:push, item})
  end

  # GenServer and Impl part
  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, current_stack) do
    {:reply, current_stack |> List.first(), current_stack |> List.delete_at(0)}
  end

  def handle_cast({:push, item}, current_stack) do
    #raise "oops"
    {:noreply, [item | current_stack ]}
  end

  def terminate(reason, state) do
    IO.puts """
    Terminating
    ===========
    Reason: #{inspect reason}
    State: #{inspect state}
    """
  end
end
