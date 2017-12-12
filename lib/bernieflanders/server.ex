require IEx;

defmodule Bernieflanders.Server do
  use GenServer

  def start_link(list) do
    GenServer.start_link(__MODULE__, list, name: __MODULE__)
  end

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(handles) do
    spawn_link(fn -> Bernieflanders.Twitterstream.stream(handles) end)
    {:ok, handles}
  end
end
