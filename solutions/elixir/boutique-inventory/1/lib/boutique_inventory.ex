defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort(inventory, &(&1[:price] <= &2[:price]))
  end

  def with_missing_price([]), do: []
  def with_missing_price([%{price: nil} = head | tail]), do: [head | with_missing_price(tail)]
  def with_missing_price([head | tail]), do: with_missing_price(tail)

  def update_names([], _old_word, _new_word), do: []
  def update_names([%{name: name} = item | inventory], old_word, new_word) do
    [
      %{item | name: String.replace(name, old_word, new_word)}
      | update_names(inventory, old_word, new_word)
    ]
  end

  def increase_quantity(item, count) do
    quantity_by_size =
      item[:quantity_by_size]
      |> Enum.map(fn {size, quantity} -> {size, quantity + count} end)
      |> Map.new()

    %{item | quantity_by_size: quantity_by_size}
  end

  def total_quantity(item) do
    item[:quantity_by_size]
    |> Enum.reduce(0, fn {_, quantity}, total -> total + quantity end)
  end
end
