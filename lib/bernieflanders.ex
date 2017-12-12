defmodule Bernieflanders do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    :ok = ExTwitter.configure(Application.get_env(:extwitter, :oauth))
    handles = Application.get_env(:bernieflanders, :handles)

    Supervisor.start_link([
      {Bernieflanders.Server, [handles]}
    ], strategy: :one_for_one)
  end
end
