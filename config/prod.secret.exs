use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :clog, Clog.Endpoint,
  secret_key_base: "g0N/hjWRjW06ePKZOP2ZPbWb7n8tcGeRUiIr+5Oi4Ku73LfG//y+zgi+JU++nO4w"

# Configure your database
config :clog, Clog.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "postgres",
  password: "postgres",
  database: "clog_prod"
