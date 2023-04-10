import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :frozen, Frozen.Repo,
  database: Path.expand("../frozen_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :frozen, FrozenWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "X+FPu2Q9EzmvBjSffPgXeJxvA3g0bLUOt7U9j7XSyrBPhaZl5V2/ZQ4LAwWRxx+D",
  server: false

# In test we don't send emails.
config :frozen, Frozen.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
