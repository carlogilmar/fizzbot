defmodule ElixirFizz.Bot do

  def answer({_fizzbot, false}), do: "Elixir"
  def answer({fizzbot, true}), do: generate_answer(fizzbot, length(fizzbot["rules"]))

  defp generate_answer(fizzbot, 2) do
    [numberA, numberB] = fizzbot["rules"]
    tokens =
      for number <- fizzbot["numbers"] do
        fizzbuzz({number, rem(number, numberA["number"])== 0, numberA["response"], rem(number, numberB["number"]) == 0, numberB["response"]})
      end
    Enum.join(tokens, " ")
  end

  defp generate_answer(fizzbot, 3) do
    [numberA, numberB, numberC] = fizzbot["rules"]
    tokens =
      for number <- fizzbot["numbers"] do
        fizzbot({ number,
                   rem(number, numberA["number"])== 0,
                   numberA["response"],
                   rem(number, numberB["number"]) == 0,
                   numberB["response"],
                   rem(number, numberC["number"]) == 0,
                   numberC["response"]
                 })
      end
    Enum.join(tokens, " ")
  end

  defp fizzbuzz({number, false, _numberA, false, _numberB}), do: "#{number}"
  defp fizzbuzz({_number, true, numberA, false, _numberB}), do: numberA
  defp fizzbuzz({_number, false, _numberA, true, numberB}), do: numberB
  defp fizzbuzz({_number, true, numberA, true, numberB}), do: "#{numberA}#{numberB}"


  defp fizzbot({_number, true, respA, true, respB, true, respC}), do: "#{respA}#{respB}#{respC}"
  defp fizzbot({_number, true, respA, false, _respB, false, _respC}), do: respA
  defp fizzbot({_number, false, _respA, true, respB, false, _respC}), do: respB
  defp fizzbot({_number, false, _respA, false, _respB, true, respC}), do: respC
  defp fizzbot({number, false, _respA, false, _respB, false, _respC}), do: number
  defp fizzbot({_number, true, respA, true, respB, false, _respC}), do: "#{respA}#{respB}"
  defp fizzbot({_number, true, respA, false, _respB, true, respC}), do: "#{respA}#{respC}"
  defp fizzbot({_number, false, _respA, true, respB, true, respC}), do: "#{respB}#{respC}"

end
