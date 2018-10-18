defmodule Chop do
  defp check(actual, guess, range) when actual < guess do
    lower.._ = range
    guess(actual, lower..guess-1)
  end

  defp check(actual, guess, range) when actual > guess do
    _..upper = range
    guess(actual, guess+1..upper)
  end

  defp check(_, guess, _) do
    guess
  end

  def guess(actual, range) do
    lower..upper = range
    guess = div((upper+lower),2)

    IO.puts "Is it #{guess}"
    check(actual, guess, range)
  end
end
