defmodule Mix.Tasks.Freeze do
  # Annotate the routes you want to visit/parse based on publicly available
  # Add generator for routes that are based on dynamic values (available when running server but not static)
  # Create the _freeze folder
  # Copy assets folder to _freeze
  # Generate list of routes to visit based on router.ex and generators
  # Query the routes and get the HTML back
  # Use system command to run wrangler to upload to cloudflare pages
  use Mix.Task
  alias Phoenix.Router
  alias HTTPoison

  def run(_) do
    # Need to ask about this
    routes = Router.routes(FrozenWeb.Router)
    IO.inspect(routes, label: "routes")

    # Filter by map having these keys
    # helper: "posts",
    # metadata: %{log: :debug},
    # path: "/posts/new",
    # plug: BlogWeb.PostsController,
    # plug_opts: :new,
    # verb: :get

    pages =
      Enum.filter(
        # Match on list of maps wehree hleper is "page"
        routes,
        fn route -> route[:helper] == "page" end
      )

    IO.inspect(pages, label: "pages")

    {:ok, _} = Application.ensure_all_started(:frozen, :permanent)
    FrozenWeb.Endpoint.start_link()

    # Get path, omodule and fuction from list
    Application.get_env(:frozen,)

    # Generate list of routes

    # Determine save path fro mix.exs default _freeze

    # Visit all the pages and download to folder
    # Copy static assets to folder

    # ADD CLOUDFLARE PIECE HERE WITH CF FLAG
  end

  def get_app_name() do
    # How to import AppWeb module to get router etc
  end

  def download_page(url) do
    {:ok, response} = HTTPoison.get(url)
    response.body
  end
end
