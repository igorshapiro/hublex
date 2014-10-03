use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, Hub.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_hub_key",
  session_secret: "=C(7FQJZM(QVT1^%1^K%98I(D*RYZP&5B4$95C8(M&&W4Y1VGBW5@!8@EVV%O*@FBJ8%(WFH+&9_&N*"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

