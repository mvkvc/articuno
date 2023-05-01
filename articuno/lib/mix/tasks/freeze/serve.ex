defmodule Mix.Tasks.Freeze.Serve do
  use Mix.Task

  def run(_) do
    Mix.Tasks.Run.run(args())
  end

  defp args do
    ["--no-halt"]
  end
end
