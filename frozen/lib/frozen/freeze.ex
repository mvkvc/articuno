defmodule Frozen.Freeze do
  def posts_id(n \\ 2) do
    0..n
    |> Enum.map(fn x -> "/posts/#{x}" end)
    |> IO.inspect()
  end
end
