defmodule ElixirFizz do
  alias ElixirFizz.Bot

  @base_url "https://api.noopschallenge.com"

  # Only you have to open the iEX in this project and:
  #
  #   > iex -S mix
  #
  #   Interactive Elixir (1.8.1) - press Ctrl+C to exit (type h() ENTER for help)
  #   iex(1)> ElixirFizz.start
  #
  def start() do
    "/fizzbot"
      |> start_fizzbot_for_first_time()
      |> ask_to_fizzbot()
  end

  defp start_fizzbot_for_first_time(starter_uri), do: get(starter_uri)

  defp ask_to_fizzbot(fizzbot) do
    next_fizzbot = get(fizzbot["nextQuestion"])
    show_rules(next_fizzbot)
    answer = Bot.answer({next_fizzbot, Map.has_key?(next_fizzbot, "numbers")})
    answer_to_fizzbot({next_fizzbot, fizzbot["nextQuestion"], answer})
  end

  defp answer_to_fizzbot({fizzbot, question_uri, answer}) do
    IO.puts "\nSe generó la siguiente respuesta: #{answer}"
    fizzbot_answer = post(question_uri, %{"answer" => answer})
    validate_answer({fizzbot_answer, fizzbot, question_uri})
  end

  defp getting_answer() do
    answer = IO.gets("\nWrite your answer::_ ") |> String.trim()
    IO.puts "\nYour answer is: #{answer}"
    answer
  end

  defp show_rules(fizzbot) do
    validate_rules = fn
      true ->
        IO.puts ":: GitHub :: Meet the Noobs :: Fizzbot Message ::"
        IO.puts fizzbot["message"]
        IO.puts "The rules are:"
        IO.inspect fizzbot["rules"]
        IO.puts "\nYour numbers are:"
        IO.inspect fizzbot["numbers"]
      false ->
        IO.puts fizzbot["message"]
    end
    validate_rules.(Map.has_key?(fizzbot, "rules"))
  end

  defp validate_answer({fizzbot_answer, fizzbot, question_uri}) do
    validate_fizzbot = fn
      "correct" ->
        IO.puts "\nAnswer Correct!!"
        IO.puts "Next question...\n"
        ask_to_fizzbot(fizzbot_answer)
      "incorrect" ->
        IO.puts fizzbot_answer["message"]
        IO.puts "Try again!!"
        answer_to_fizzbot({fizzbot, question_uri})
    end
    validate_fizzbot.(fizzbot_answer["result"])
  end

  defp get(uri) do
    {:ok, response} = HTTPoison.get("#{@base_url}#{uri}")
    Poison.decode!(response.body)
  end

  defp post(uri, body) do
    {:ok, response} = HTTPoison.post("#{@base_url}#{uri}", Poison.encode!(body), [{"Content-type", "application/json"}])
    Poison.decode!(response.body)
  end

end
