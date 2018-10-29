defmodule StringsAndBinaries do
  def onlyAscii?(list) do
    Enum.all?(list, fn x -> x > 31 && x < 127 end)
  end

  def anagram?(word1, word2) when is_bitstring(word1) and is_bitstring(word2) do
    anagram?(String.to_charlist(word1), String.to_charlist(word2))
  end
  def anagram?(word1, word2) when is_list(word1) and is_list(word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  def calc(list) when is_list(list) do
    [a, op, b] = List.to_string(list) |> String.split(" ")
    {n1, _} = Integer.parse(a)
    {n2, _} = Integer.parse(b)

    _calc(n1, n2, op)
  end
  def _calc(n1, n2, "+"), do: n1 + n2
  def _calc(n1, n2, "-"), do: n1 - n2
  def _calc(n1, n2, "*"), do: n1 * n2
  def _calc(n1, n2, "/"), do: n1 / n2

  def center(list) do
    longest = String.length(Enum.max_by(list, fn x -> String.length(x) end))

    for term <- list do
      len = String.length(term)
      p = div((longest - len), 2)
      String.pad_leading(term, len + p)
    end |> Enum.join("\n") |> IO.puts
  end

  def capitalize_sentences(str) do
    sentences = String.split(str, ". ")
    Enum.map(sentences, fn x ->  String.capitalize(x) end)
    |> Enum.join(". ")
    |> IO.puts
  end
end
