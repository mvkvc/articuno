defmodule Mix.Tasks.Freeze.Init do
  use Mix.Task
  import Articuno.Config

  @default_path "priv/freeze.exs"

  def run(args) do
    {parsed, _, _} = OptionParser.parse(args, strict: [path: :string, overwrite: :boolean])
    path = Keyword.get(parsed, :path, @default_path)
    overwrite = Keyword.get(parsed, :overwrite, false)

    path = Path.absname(path)

    cond do
      File.exists?(path) and !overwrite ->
        IO.puts("Freeze file already exists")

      true ->
        generate_default_config(path)
    end
  end
end
