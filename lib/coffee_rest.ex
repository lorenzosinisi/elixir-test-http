defmodule CoffeeRest do
  # {:ok, _} = Plug.Adapters.Cowboy.http CoffeeRest, []
  use Router
  
  def route("GET", ["hello"], conn) do
    conn |> Plug.Conn.send_resp(200, "Hello there")
  end

  def route("GET", [], conn) do
    conn |> Plug.Conn.send_resp(200, "CoffeRest app made in Elixir")
  end

  def route("GET", ["users", id], conn) do
    conn |> Plug.Conn.send_resp(200, "User##{id} found in our DB")
  end

  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Page not found")
  end
end
