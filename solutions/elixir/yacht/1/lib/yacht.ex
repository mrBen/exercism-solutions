defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(:full_house, [dice, dice, dice, dice, dice]), do: 0
  def score(:full_house, [dice1, dice1, dice1, dice2, dice2]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice1, dice1, dice2, dice1, dice2]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice1, dice2, dice1, dice1, dice2]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice1, dice2, dice1, dice2, dice1]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice1, dice2, dice2, dice1, dice1]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice2, dice1, dice1, dice1, dice2]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice2, dice1, dice1, dice2, dice1]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice2, dice1, dice2, dice1, dice1]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, [dice2, dice2, dice1, dice1, dice1]), do: 3 * dice1 + 2 * dice2
  def score(:full_house, _), do: 0
  def score(:four_of_a_kind, [dice, dice, dice, dice, _dice]), do: 4 * dice
  def score(:four_of_a_kind, [dice, dice, dice, _dice, dice]), do: 4 * dice
  def score(:four_of_a_kind, [dice, dice, _dice, dice, dice]), do: 4 * dice
  def score(:four_of_a_kind, [dice, _dice, dice, dice, dice]), do: 4 * dice
  def score(:four_of_a_kind, [_dice, dice, dice, dice, dice]), do: 4 * dice
  def score(:four_of_a_kind, _), do: 0
  def score(:little_straight, dice) do
    if Enum.member?(dice, 1)
    && Enum.member?(dice, 2)
    && Enum.member?(dice, 3)
    && Enum.member?(dice, 4)
    && Enum.member?(dice, 5) do
      30
    else
      0
    end
  end
  def score(:big_straight, dice) do
    if Enum.member?(dice, 2)
    && Enum.member?(dice, 3)
    && Enum.member?(dice, 4)
    && Enum.member?(dice, 5)
    && Enum.member?(dice, 6) do
      30
    else
      0
    end
  end
  def score(:choice, dice), do: Enum.sum(dice)
  def score(:yacht, [dice, dice, dice, dice, dice]), do: 50
  def score(:yacht, _), do: 0
  def score(category, dice) do
    dice
    |> Enum.filter(fn x -> case category do
          :ones -> x == 1
          :twos -> x == 2
          :threes -> x == 3
          :fours -> x == 4
          :fives -> x == 5
          :sixes -> x == 6
        end
      end)
    |> Enum.sum
  end
end