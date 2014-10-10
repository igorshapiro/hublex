Code.require_file "../../test_helper.exs", __ENV__.file

defmodule GoldenFlowsFacts do
  use IntegrationTest.Case

  setup do
    start_hub

    # When called the test service will send a message to a process named
    # :test_process
    Process.register(self(), :test_process)
    :ok
  end

  test "Check URNA" do
    IO.inspect self()
    start_server "TestService", 8080, "/order_paid", fn(conn, _) ->
      conn |> text("")
    end
    {:ok} = HubClient.publish "order_paid", %{a: 1}

    assert_received {:request, "/order_paid", _}
  end
end
