defmodule Articuno.Fetch do
  def fetch(url) do
    request = HTTPoison.get!(url)

    request.body
  end
end
