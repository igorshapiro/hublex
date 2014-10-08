defmodule RESTClient do
  use HTTPoison.Base
  use Jazz

  def post_json(url, content)do
    post(url, JSON.encode!(content), %{"Content-Type" => "application/json"})
  end
end
