defmodule Chartreuse.String do
  import String

  def blank? nil do
    true
  end

  def blank? str do
    0 == strip(str) |> String.length
  end

  def present? str do
    !blank?(str)
  end
end
