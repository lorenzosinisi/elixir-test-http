defmodule CoffeeRest do
  use Router
  use DefinedRouters
  require Logger

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, 
        CoffeeRest, 
        [], 
        port: Application.get_env(:coffee, :http_port)
      )
    ]

    Logger.info "Started application http://localhost:#{Application.get_env(:coffee, :http_port)}"

    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
