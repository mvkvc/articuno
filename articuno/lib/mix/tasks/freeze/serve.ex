defmodule Mix.Tasks.Freeze.Serve do
  use Mix.Task
  require Logger

  def run(_) do
    Mix.Tasks.Run.run(args())
    browser_open("http://localhost:3000")
  end

  defp args do
    ["--no-halt"]
  end

  # https://github.com/livebook-dev/livebook/blob/75e47aa59318bbc7b2cf0f423e785e4c55d55f62/lib/livebook/utils.ex#L339
  def browser_open(url) do
    win_cmd_args = ["/c", "start", String.replace(url, "&", "^&")]

    cmd_args =
      case :os.type() do
        {:win32, _} ->
          {"cmd", win_cmd_args}

        {:unix, :darwin} ->
          {"open", [url]}

        {:unix, _} ->
          cond do
            System.find_executable("xdg-open") -> {"xdg-open", [url]}
            # When inside WSL
            System.find_executable("cmd.exe") -> {"cmd.exe", win_cmd_args}
            true -> nil
          end
      end

    case cmd_args do
      {cmd, args} -> System.cmd(cmd, args)
      nil -> Logger.warn("could not open the browser, no open command found in the system")
    end

    :ok
  end
end
