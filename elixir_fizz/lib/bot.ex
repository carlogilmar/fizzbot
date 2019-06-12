defmodule ElixirFizz.Bot do

  def answer({_fizzbot, false}), do: "Elixir"
  def answer({fizzbot, true}), do: generate_answer(fizzbot["numbers"])

  defp generate_answer(numbers) do
    tokens =
      for number <- numbers do
        fizzbuzz({number, rem(number, 3)== 0, rem(number, 5) == 0})
      end
    Enum.join(tokens, " ")
  end

  defp fizzbuzz({number, false, false}), do: "#{number}"
  defp fizzbuzz({_number, true, false}), do: "Fizz"
  defp fizzbuzz({_number, false, true}), do: "Buzz"
  defp fizzbuzz({_number, true, true}), do: "FizzBuzz"

end
