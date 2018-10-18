defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n), do: n * 3

  def quadruple(n), do: double(n) * double(n)

  def multiply(a, b), do: (
    IO.puts "Doing some multiplication"
    a * b
  )
end
