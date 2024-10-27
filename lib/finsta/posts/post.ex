defmodule Finsta.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :caption, :string
    field :image_path, :string
    belongs_to :user, Finsta.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:caption, :image_path, :user_id])
    |> validate_required([:caption, :image_path, :user_id])
  end
end
