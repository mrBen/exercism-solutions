defmodule KitchenCalculator do
  defp factor(unit) do
    case unit do
      :cup -> 240
      :fluid_ounce -> 30
      :teaspoon -> 5
      :tablespoon -> 15
      :milliliter -> 1
    end
  end

  def get_volume({_, volume}), do: volume

  def to_milliliter({unit, volume}), do: {:milliliter, volume * factor(unit)}

  def from_milliliter(volume_pair, unit), do: {unit, get_volume(volume_pair) / factor(unit)}

  def convert(volume_pair, unit), do: from_milliliter(to_milliliter(volume_pair), unit)
end
