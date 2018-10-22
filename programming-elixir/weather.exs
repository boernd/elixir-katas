defmodule WeatherHistory do
  def for_location([], _target_loc), do: []
  def for_location([ head = [_, target_loc, _, _] | tail ], target_loc) do
    [ head | for_location(tail, target_loc) ]
  end
  def for_location([ _ | tail ], target_loc), do: for_location(tail, target_loc)

  def test_data do
    [
      [12345, 26, 15, 0.125],
      [12345, 20, 15, 0.125],
      [12345, 27, 15, 0.45],
      [12345, 22, 15, 0.125],
      [12345, 26, 15, 0.125],
      [12345, 27, 15, 0.468],
      [12345, 26, 15, 0.0125],
      [12345, 26, 15, 0.125],
      [12345, 27, 15, 0.05],
      [12345, 28, 24, 0.12],
      [12345, 29, 10, 0.15]
    ]
  end
end
