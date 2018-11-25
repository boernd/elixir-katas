defmodule WorkingWithMultipleProcesses2 do
  def echo do
    receive do
      {sender, name} ->
        send sender, name
    end
    echo()
  end
end

pid1 = spawn(WorkingWithMultipleProcesses2, :echo, [])
pid2 = spawn(WorkingWithMultipleProcesses2, :echo, [])

send pid1, {self(), "fred"}
receive do
  token -> IO.puts token
end

send pid2, {self(), "betty"}
receive do
  token -> IO.puts token
end
