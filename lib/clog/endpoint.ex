defmodule Clog.Endpoint do
  use Phoenix.Endpoint, otp_app: :clog

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :clog,
    only: ~w(css images js favicon.ico fonts robots.txt)

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_clog_key",
    signing_salt: "E/A4plsP",
    encryption_salt: "/NU9SIds"

  plug :router, Clog.Router
end
