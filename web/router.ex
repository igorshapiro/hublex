defmodule Hub.Router do
  use Phoenix.Router

  get "/", Hub.PageController, :index, as: :pages

end
