defmodule SpawnLinkExercise do
  def respond_and_exit(parent) do
    send parent, "Going down!"
    exit(:bye)
  end

  def receive_msg do
    receive do
      msg ->
        IO.puts "Received: #{inspect msg}"
    end
    receive_msg()
  end

  def run do
    import :timer, only: [ sleep: 1 ]

    spawn_monitor(SpawnLinkExercise, :respond_and_exit, [self()])
    sleep 500

    receive_msg()
  end
end
