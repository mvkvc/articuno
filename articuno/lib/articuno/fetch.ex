defmodule Articuno.Fetch do
  def fetch(url, port, ext, save) do
    if !File.exists?(save) do
      File.mkdir!(save)
    end

    base_url = url <> ":" <> to_string(port)
    full_url = base_url <> ext
    request = HTTPoison.get!(full_url)
    path_list = get_save_file(ext)
    write_file(path_list, save, request.body)
  end

  def write_file([h | []], path, body) do
    path = path <> "/" <> h <> ".html"
    File.write!(path, body)
  end

  def write_file([h | t], path, body) do
    path = path <> "/" <> h
    if !File.exists?(path), do: File.mkdir!(path)
    write_file(t, path, body)
  end

  def get_save_file(ext) do
    if ext == "" do
      ["index"]
    else
      ext
      |> String.split("/")
      |> Enum.filter(&(&1 != ""))
    end
  end
end
