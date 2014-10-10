defmodule Hub.Router do
  use Phoenix.Router

  get "/", Hub.PageController, :index, as: :pages

  scope path: "/api/v1" do
    post "/messages", Api.V1.MessagesController, :deliver
  end

  # pipeline :before  do
  # end
end
