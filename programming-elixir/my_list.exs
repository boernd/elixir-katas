defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]) do
    1 + len(tail)
  end

  def square([]), do: []
  def square([head | tail]) do
    [head * head | square(tail) ]
  end

  def add_1([]), do: []
  def add_1([head | tail]) do
    [head + 1 | add_1(tail) ]
  end

  def map([], _func), do: []
  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  def reduce([], value, _fun), do: value
  def reduce([head | tail], value, fun) do
    reduce(tail, fun.(head, value), fun)
  end

  def mapsum(list, fun) do
    map(list,fun) |> reduce(0, &(&1 + &2))
  end

  def greater?(a, b) do
    cond do
      a > b -> a
      true -> b
    end
  end
  def max(list) do
    reduce(list, 0, &(greater?(&1, &2)))
  end

  def add_13?(item, n) do
    cond do
      item + n > 122 ->  item + n - (2 * n)
      true -> item + n
    end
  end
  def caesar(list, n) do
    map(list, &(add_13?(&1, n)))
  end

  def span(a, b) do
    for i <- a..b, do: i
  end
end
