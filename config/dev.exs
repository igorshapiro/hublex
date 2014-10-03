use Mix.Config

config :phoenix, Hub.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_hub_key",
  session_secret: "=C(7FQJZM(QVT1^%1^K%98I(D*RYZP&5B4$95C8(M&&W4Y1VGBW5@!8@EVV%O*@FBJ8%(WFH+&9_&N*",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


