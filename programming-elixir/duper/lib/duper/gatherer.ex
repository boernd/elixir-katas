defmodule Duper.Gatherer do
  use GenServer

  @me Gatherer

  # API

  def start_link(worker_count) do
    GenServer.start_link(__MODULE__, worker_count, name: @me)
  end

  def done() do
    GenServer.cast(@me, :done)
  end

  def result(path, hash) do
    GenServer.cast(@me, { :result, path, hash })
  end

  # server

  def init(worker_count) do
    Process.send_after(self(), :kickoff,0)
    { :ok, worker_count }
  end

  def handle_cast(:done, _worker_count = 1) do
    report_results()
    System.halt(0)
  end

  def handle_cast(:done, _worker_count) do
    { :no_reploy, worker_count - 1 }
  end

  def handle_cast({ :result, path, hash }, worker_count) do
    IO.puts "Results:\n"
    Duper.Results.find_duplicates()
    |> Enum.each(&IO.inspect/1)
  end

  def handle_info(:kickoff, worker_count) do
    1..worker_count
    |> Enum.each(fn _ -> Super.WorkerSupervisor.add_worker() end)
    { :noreply, worker_count }
  end
end
