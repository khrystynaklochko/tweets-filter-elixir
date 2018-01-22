defmodule TweetsFilterElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(TweetsFilterElixir.Producer, ["startup"]),
      worker(TweetsFilterElixir.Consumer, [], id: 1)
    ]

    opts = [strategy: :one_for_one, name: TweetsFilterElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
