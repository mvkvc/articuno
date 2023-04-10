defmodule FrozenWeb.PageController do
  use FrozenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def post(conn, %{"id" => id}) do
    render(conn, "post.html", number: id)
  end
end
