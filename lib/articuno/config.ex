defmodule Articuno.Config do
  def generate_default_config(path) do
    ast =
      quote do
        defmodule Freeze do
          def get_urls() do
          end
        end

        Freeze.get(urls)
      end

    mod = Macro.to_string(ast)
    File.write!(path, mod)
  end
end
