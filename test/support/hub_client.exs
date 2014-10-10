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

  defp handle_response(%{body: body, status_code: 200}) do
    {:ok}
  end

  defp handle_response(%{status_code: http_code, body: body}) do
    {:error, message: body, http_code: http_code}
  end
end
