defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2), do: {:error, "strands must be of equal length"}
  def hamming_distance([], []), do: {:ok, 0}
  def hamming_distance([letter | strand1], [letter | strand2]), do: hamming_distance(strand1, strand2)
  def hamming_distance([_ | strand1], [_ | strand2]) do
      {:ok, result} = hamming_distance(strand1, strand2)
      {:ok, 1 + result}
  end
end
