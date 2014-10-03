# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, Hub.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_hub_key",
  session_secret: "=C(7FQJZM(QVT1^%1^K%98I(D*RYZP&5B4$95C8(M&&W4Y1VGBW5@!8@EVV%O*@FBJ8%(WFH+&9_&N*",
  catch_errors: true,
  debug_errors: false,
  error_controller: Hub.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
