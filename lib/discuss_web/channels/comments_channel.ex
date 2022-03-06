defmodule DiscussWeb.CommentsChannel do
  use Phoenix.Channel

  def join(name, _param, socket) do
    IO.puts("+++++++++")
    IO.puts(name)
    IO.puts("+++++++++")
    {:ok, %{hey: "there"}, socket}
  end

  def handle_in() do

  end
end