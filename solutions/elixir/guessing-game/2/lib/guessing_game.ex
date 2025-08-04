defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(_secret_number, guess) when guess == :no_guess,
    do: "Make a guess"
  def compare(secret_number, guess) do
    cond do
      guess == secret_number -> "Correct"
      abs(guess - secret_number) <= 1 -> "So close"
      guess > secret_number -> "Too high"
      guess < secret_number -> "Too low"
    end
  end
end
