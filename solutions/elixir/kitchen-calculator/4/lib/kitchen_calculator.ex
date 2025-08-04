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

  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / factor(unit)}

  def convert(volume_pair, unit), do: volume_pair |> to_milliliter() |> from_milliliter(unit)
end
