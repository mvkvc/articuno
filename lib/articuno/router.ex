defmodule Articuno.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/*url" do
    name =
      if url == [] do
        ["index"]
      else
        url
      end

    name = Enum.join(name, "/")
    name = if !Regex.match?(~r/\.[^.]+$/, name), do: "#{name}.html", else: name
    file_path = "_freeze/#{name}"

    if File.exists?(file_path) do
      conn
      |> Plug.Conn.send_file(200, file_path)
    else
      conn
      |> Plug.Conn.send_resp(404, "Page not found")
    end
  end

  match _ do
    send_resp(conn, 404, "Page not found")
  end
end
