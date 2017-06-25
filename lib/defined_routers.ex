defmodule DefinedRouters do
  defmacro __using__(_opts) do
    quote do
      import Plug.Conn
      # /users/1
      def route("GET", ["users", id], conn) do
        conn |> send_resp(200, "User##{id} found in our DB")
      end
      
      # /hello
      def route("GET", ["hello"], conn) do
        conn |> send_resp(200, "Hello there")
      end

      # /
      def route("GET", [], conn) do
        conn |> send_resp(200, "CoffeRest app made in Elixir")
      end

      # 404
      def route(_method, _path, conn) do
        conn |> send_resp(404, "Page not found")
      end
    end
  end
end