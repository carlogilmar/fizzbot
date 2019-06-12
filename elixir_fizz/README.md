# FizzBot Elixir Solution

- Requirements for test this solution
- Download dependencies
- Run this solution
- How it works
- ElixirFizz module design

## Requirements for test this solution

  1. Install in your computer Elixir (I used 1.8.1 version)

## Download dependencies

For this project I created a mix project because I needed two dependencies for make http requests *httpoison 1.0* and parser the responses *poison 3.1*, that's the reason that I'm using a mix project.

For download this dependencies you need an elixir installation in your computer, and in this directory *fizzbot/elixir_fizz* run:

> mix deps.get

## Run this solution

Elixir have a useful REPL, we should use it for test this project. For run a REPL with this mix project you have to run:

> iex -S mix

Then for test the solution, into the REPL run:

> ElixirFizz.start

```
$ iex -S mix

Erlang/OTP 21 [erts-10.3.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]
Compiling 1 file (.ex)
Interactive Elixir (1.8.1) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> ElixirFizz.start
```

## How it works

The next step is answer the questions in the REPL. If your answer is *correct* then you will have to answer the next question, but if your answer is *incorrect* you will have to answer again until your answer will be correct.

#### Correct Answer

```
iex(1)> ElixirFizz.start
What is your favorite programming language?
Mine is COBOL, of course.
POST your answer back to this URL in JSON format. If you are having difficulties, see the exampleResponse provided.

Write your answer::_ Elixir

Your answer is: Elixir

Answer Correct!!
Next question...
```

#### Incorrect Answer

```
Your numbers are:
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

Write your answer::_ 1 2 Fizz 4 Buzz 6

Your answer is: 1 2 Fizz 4 Buzz 6
Answer is incorrect starting at position 16 ("6")
Try again!!

Write your answer::_
```

## ElixirFizz module design

The *ElixirFizz* elixir module contains many funcions.

The main funcion is *start()* and it's the only public function, this initialize the Fizzbot and start to make the request for answer to this bot.

This are the private functions:

Make the first request to Fizzbot
- `start_fizzbot_for_first_time(starter_uri)`

Ask and answer
- `ask_to_fizzbot(fizzbot)`
- `answer_to_fizzbot({fizzbot, question_uri})`

Input and output functions
- `getting_answer()`
- `show_rules(fizzbot)`

Retry answer when it's wrong
- `validate_answer({fizzbot_answer, fizzbot, question_uri})`

Make and parse requests
- `get(uri)`
- `post(uri)`

If you want to see it you could follow this simple guide for understand how it works, and if you have some questions you can find me at Twitter as @carlogilmar.
