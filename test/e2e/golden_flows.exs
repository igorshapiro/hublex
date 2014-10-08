Code.require_file "../../test_helper.exs", __ENV__.file

defmodule GoldenFlowsFacts do
  use Amrita.Sweet

  defmodule TestService do
    use Urna, adapters: [Urna.JSON]

    resource :order_paid do
      post do
        %{"a" => "b"}
      end
    end
  end

  setup do
    {:ok, status} = RESTClient.start
  end

  test "Check URNA" do
    Urna.start TestService, port: 8080
    %HTTPoison.Response{status_code: 200} = "http://localhost:8080/order_paid"
      |> RESTClient.post_json(%{hello: "world"})
      |> IO.inspect
  end
end
