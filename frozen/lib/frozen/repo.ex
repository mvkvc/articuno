defmodule Frozen.Repo do
  use Ecto.Repo,
    otp_app: :frozen,
    adapter: Ecto.Adapters.SQLite3
end
