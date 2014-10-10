defmodule Api.V1.MessagesController do
  use Phoenix.Controller
  use Jazz
  HTTPoison.start

  def deliver conn, msg do
    res =  HTTPoison.post("http://localhost:8080/order_paid", JSON.encode!(msg))
    IO.inspect res
    conn |> json JSON.encode!(%{"status": "ok"})
  end
end
