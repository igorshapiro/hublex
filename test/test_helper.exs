Phoenix.CodeReloader.reload!
ExUnit.start
Amrita.start(formatter: Amrita.Formatter.Documentation)
RESTClient.start

defmodule HTTPServer do
  def start_server do
    Hub.Router.start
  end

  def stop_server do
    Plug.Adapters.Cowboy.shutdown Hub.Router.HTTP
  end
end

defmodule IntegrationTest.Case do
  defmacro __using__(_options) do
    quote do
      use Amrita.Sweet
      import HTTPServer
    end
  end
end

defmodule HubClient do
  def url do
    "http://localhost:4000/api/v1/messages"
  end

  def publish(metadata, content) when is_map(metadata) do
    request Map.put(metadata, :content, content)
  end

  def publish message_type, content do
    request %{type: message_type, content: content}
  end

  defp request payload do
    url
      |> RESTClient.post_json(payload)
      |> handle_response
  end

  defp handle_response(%{status_code: http_code, body: body})
    when http_code != 200 do

    {:error, message: body, http_code: http_code}
  end

  defp handle_response(%{body: body}) do
    {:ok}
  end
end
