defmodule Router do
  defmacro __using__(_opts) do
    quote do
      def init(options) do
        options
      end
      def call(conn, _opts) do
        conn |> IO.inspect 
        route(conn.method, conn.path_info, conn)
      end
    end
  end
end