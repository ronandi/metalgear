defmodule Vgdb.Endpoint do
  use Phoenix.Endpoint, otp_app: :vgdb

  plug Plug.Static,
    at: "/", from: :vgdb

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
    key: "_vgdb_key",
    signing_salt: "pQxOUE2M",
    encryption_salt: "rzaZmTXJ"

  plug :router, Vgdb.Router
end
