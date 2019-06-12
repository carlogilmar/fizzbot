defmodule ElixirFizz.Bot do

  def answer({_fizzbot, false}), do: "Elixir"
  def answer({fizzbot, true}), do: generate_answer(fizzbot)

  defp generate_answer(fizzbot) do
    numbers = fizzbot["numbers"]
    [numberA, numberB] = fizzbot["rules"]
    tokens =
      for number <- numbers do
        fizzbuzz({number, rem(number, numberA["number"])== 0, numberA["response"], rem(number, numberB["number"]) == 0, numberB["response"]})
      end
    Enum.join(tokens, " ")
  end

  defp fizzbuzz({number, false, _numberA, false, _numberB}), do: "#{number}"
  defp fizzbuzz({_number, true, numberA, false, _numberB}), do: numberA
  defp fizzbuzz({_number, false, _numberA, true, numberB}), do: numberB
  defp fizzbuzz({_number, true, numberA, true, numberB}), do: "#{numberA}#{numberB}"

end
