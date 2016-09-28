defmodule Chartreuse.Enum do
  def compact list do
    Enum.reject(list, &(is_nil(&1)))
  end

  def flatten([]), do: []

  def flatten([ head | tail ]) do
    flatten(head) ++ flatten(tail)
  end

  def flatten(head), do: [ head ]

  def chunk(list, chunk_size) do
    chunk(list, chunk_size, [], [], 0)
  end

  defp chunk([], _chunk_size, chunks, accum, accum_size) when accum_size > 0 do
    chunks ++ [accum]
  end

  defp chunk([], _chunk_size, chunks, _accum, _accum_size) do
    chunks
  end

  defp chunk([h|t], chunk_size, chunks, accum, accum_size) do
    accum = accum |> List.insert_at(-1, h)
    accum_size = accum_size + 1
    {chunks, accum, accum_size} = remap_chunk_values chunks, accum, chunk_size, accum_size
    chunk t, chunk_size, chunks, accum, accum_size
  end

  defp remap_chunk_values(chunks, accum, chunk_size, accum_size) when accum_size == chunk_size do
    {chunks |> List.insert_at(-1, accum), [], 0}
  end

  defp remap_chunk_values(chunks, accum, _chunk_size, accum_size) do
    {chunks, accum, accum_size}
  end
end
