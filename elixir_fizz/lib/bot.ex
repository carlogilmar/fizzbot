defmodule ElixirFizz.Bot do

  def generate_answer(numbers) do
    tokens =
      for number <- numbers do
        fizzbuzz({number, rem(number, 3)== 0, rem(number, 5) == 0})
      end
    Enum.join(tokens, " ")
  end

  def fizzbuzz({number, false, false}), do: "#{number}"
  def fizzbuzz({_number, true, false}), do: "Fizz"
  def fizzbuzz({_number, false, true}), do: "Buzz"
  def fizzbuzz({_number, true, true}), do: "FizzBuzz"

end
