defmodule Bernieflanders do
  use Application

  def start(_type, _args) do
    IO.puts "HELLO"
    import Supervisor.Spec, warn: false

    :ok = ExTwitter.configure(Application.get_env(:extwitter, :oauth))
    handles = Application.get_env(:bernieflanders, :handles)

    children = [
      worker(Bernieflanders.Server, [handles])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bernieflanders.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
