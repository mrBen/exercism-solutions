defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(has_been_in_the_oven) do
    expected_minutes_in_oven() - has_been_in_the_oven
  end

  def preparation_time_in_minutes(number_of_layers) do
    number_of_layers * 2
  end

  def total_time_in_minutes(number_of_layers, has_been_in_the_oven) do
    preparation_time_in_minutes(number_of_layers) + has_been_in_the_oven
  end

  def alarm, do: "Ding!"
end
