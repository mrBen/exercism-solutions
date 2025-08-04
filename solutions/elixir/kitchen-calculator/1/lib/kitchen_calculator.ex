defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    case volume_pair do
      {:cup, value} -> {:milliliter, value * 240}
      {:fluid_ounce, value} -> {:milliliter, value * 30}
      {:teaspoon, value} -> {:milliliter, value * 5}
      {:tablespoon, value} -> {:milliliter, value * 15}
      _ -> volume_pair
    end
  end

  def from_milliliter(volume_pair, unit) do
    case unit do
      :cup -> {unit, get_volume(volume_pair) / 240}
      :fluid_ounce -> {unit, get_volume(volume_pair) / 30}
      :teaspoon -> {unit, get_volume(volume_pair) / 5}
      :tablespoon -> {unit, get_volume(volume_pair) / 15}
      _ -> volume_pair
    end
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
