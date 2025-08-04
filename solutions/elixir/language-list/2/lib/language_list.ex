defmodule LanguageList do
  def new(), do: []

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    tl(list)
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    case list do
      [] -> false
      _ -> hd(list) == "Elixir" or functional_list?(tl(list))
    end
  end
end
