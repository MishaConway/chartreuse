defmodule Chartreuse.List do
  def merge(a, b) do
    lambda = fn({k,v}, acc) -> Map.update(acc, k, {k, v}, &Tuple.append(&1, v)) end
    map = Enum.reduce(a ++ b, Map.new, lambda)
    Map.values(map)
  end
end
