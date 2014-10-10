Phoenix.CodeReloader.reload!
ExUnit.start
Amrita.start(formatter: Amrita.Formatter.Documentation)
RESTClient.start

defmodule HubServer do
  def start_hub do
    Hub.Router.start
  end

  def stop_hub do
    Hib.Router.stop
  end

  defmacro start_server name, port, path, handler do
    controller_name = String.to_atom("#{name}Controller")
    router_name = String.to_atom("#{name}Router")
    quote do
      ctrl = defmodule unquote(controller_name) do
        use Phoenix.Controller

        def handle conn, msg do
          IO.puts "Got message"
          send Process.whereis(:test_process), {:request, unquote(path), unquote(name)}
          unquote(handler).(conn, msg)
        end
      end

      IO.inspect ctrl

      router = defmodule unquote(router_name) do
        use Phoenix.Router

        post unquote(path), unquote(controller_name), :handle
      end
      Application.put_env(:phoenix, unquote(router_name),
        port: unquote(port),
        debug_errors: true
      )
      IO.inspect router
      {:ok, pid} = unquote(router_name).start()
    end
  end
end


defmodule IntegrationTest.Case do
  defmacro __using__(_options) do
    quote do
      use Amrita.Sweet
      import HubServer
    end
  end
end
