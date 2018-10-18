functions_2 = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

IO.puts functions_2.(0,0,0)
IO.puts functions_2.(0,"a",0)
IO.puts functions_2.(2,0,0)
IO.puts functions_2.(2,3,4)

IO.puts "======================="

functions_3 = fn
  n -> functions_2.(rem(n,3), rem(n,5), n)
end

IO.puts functions_3.(10)
IO.puts functions_3.(11)
IO.puts functions_3.(12)
IO.puts functions_3.(13)
IO.puts functions_3.(14)
IO.puts functions_3.(15)
IO.puts functions_3.(16)
