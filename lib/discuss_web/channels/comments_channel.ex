defmodule DiscussWeb.CommentsChannel do

  use DiscussWeb, :channel
  alias DiscussWeb.{Topic, Comment}

  def join("comments:" <> id = name, _param, socket) do
    topic_id = String.to_integer(id)
    topic = Topic
            |> Repo.get(topic_id)
            |> Repo.preload(:comments)

    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, socket) do
    topic = socket.assigns.topic

    changeset = topic
                |> build_assoc(:comments)
                |> Comment.changeset(%{content: content})

    case Repo.insert(changeset) do
      {:ok, comment} ->
        {:reply, :ok, socket}
      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end
end