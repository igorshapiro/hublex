defmodule Api.V1.MessagesController do
  use Phoenix.Controller

  def deliver conn, msg do
    IO.inspect msg
    conn |> json JSON.encode!(%{"status": "ok"})
  end
end
