defmodule Sequence.Stash do
  use GenServer

  @name __MODULE__

  def start_link(initial_number) do
    GenServer.start_link(@name, initial_number, name: @name)
  end

  def get() do
    GenServer.call(@name, {:get})
  end

  def update(new_number) do
    GenServer.cast(@name, {:update, new_number})
  end

  # Server impl

  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call({:get}, _from, current_number) do
    {:reply, current_number, current_number}
  end

  def handle_cast({:update, new_number}, _current_number) do
    {:noreply, new_number}
  end

end

