defmodule DiscussWeb.Topic do
  use DiscussWeb, :model

  schema "topics" do
    field :title, :string
    belongs_to :user, DiscussWeb.User
    has_many :comment, DiscussWeb.Comment
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end

end