defmodule Mix.Tasks.Freeze do
  use Mix.Task
  alias HTTPoison
  alias Articuno.Fetch

  @default_config "priv/freeze.exs"
  @default_path "_freeze"
  @default_port 4000

  def run(args) do
    Mix.Task.run("phx.digest")
    File.rm_rf!(@default_path)
    File.cp_r!("priv/static", @default_path)
    app = Mix.Project.config()[:app]
    app |> IO.inspect()

    {parsed, _, _} =
      OptionParser.parse(args, strict: [config: :string, path: :string, port: :integer])

    config = Keyword.get(parsed, :config, @default_config)
    path = Keyword.get(parsed, :path, @default_path)
    port = Keyword.get(parsed, :port, @default_port)

    {urls, []} =
      config
      |> Path.absname()
      |> Code.eval_file()

    Mix.Task.run("phx.server")

    Enum.map(urls, fn url ->
      Fetch.fetch("localhost", 4000, url, path)
    end)

    System.halt()
  end
end
