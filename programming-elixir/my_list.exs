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

  def all?([], _), do: true
  def all?(list) do
    all?(list, fn a -> !!a end)
  end
  def all?([ head | tail ], fun) do
    !!fun.(head) && all?(tail, fun)
  end

  def each([], _fun), do: :ok
  def each([ head | tail ], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter([], _), do: []
  def filter([ head | tail ], fun) do
    if fun.(head) do
      [ head | filter(tail, fun) ]
    else
      filter(tail, fun)
    end
  end

  def split(list, n) when n >= 0 do
    splitter([], list, n)
  end
  def split(list, n) when n < 0 do
    splitter([], reverse(list), n)
  end

  defp splitter(a, [], _), do: {a, []}
  defp splitter(a, b, 0), do: {a, b}
  defp splitter(a, [ head | tail ], n) when n > 0 do
   splitter(a ++ [head], tail, n - 1)
  end
  defp splitter(a, [ head | tail ], n) when n < 0 do
   splitter(a ++ [head], tail, n + 1)
  end
  defp reverse([]), do: []
  defp reverse([ head | tail ]), do: reverse(tail) ++ [head]

  def take(list, n) do
    taker(list, [], n)
  end

  defp taker([], b, _), do: b
  defp taker(_, b, 0), do: b
  defp taker([ head | tail ], b, n) do
    taker(tail, b ++ [head], n - 1)
  end

  def flatten(list) do
    flattener([], list)
  end
  defp flattener(a, []), do: a
  defp flattener(a, [ h | t ]) do
    if is_list(h) do
      flattener(a, h ++ t)
    else
      flattener(a ++ [h], t)
    end
  end

  def flatten2([]), do: []
  def flatten2([ head | tail ]), do: flatten2(head) ++ flatten2(tail)
  def flatten2(value), do: [value]
end
