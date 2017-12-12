defmodule Bernieflanders.Server do
  def start_link(handles) do
    pid = spawn_link(Bernieflanders.Twitterstream, :stream, handles)
    {:ok, pid}
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end
end
