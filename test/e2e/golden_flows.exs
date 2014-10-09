Code.require_file "../../test_helper.exs", __ENV__.file

defmodule GoldenFlowsFacts do
  use IntegrationTest.Case

  defmodule TestService do
    use Urna, adapters: [Urna.JSON]

    resource :order_paid do
      post do
        %{"a" => "b"}
      end
    end
  end

  setup do
    start_server
    :ok
  end

  # teardown do
  #   stop_server
  # end

  test "Check URNA" do
    Urna.start TestService, port: 8080
    {:ok} = HubClient.publish 'order_paid', %{a: 1}
  end
end
