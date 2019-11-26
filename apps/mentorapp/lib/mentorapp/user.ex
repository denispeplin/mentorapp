defmodule Mentorapp.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :accepts_mentees, :boolean, default: false
    field :dev_role, :string
    field :forum_profile, :string
    field :full_name, :string
    field :github_user, :string
    field :other_languages, :string
    field :telegram_url, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:full_name, :github_user, :telegram_url, :forum_profile, :other_languages, :dev_role, :accepts_mentees])
    |> validate_required([:full_name, :github_user, :telegram_url, :forum_profile, :other_languages, :dev_role, :accepts_mentees])
  end
end
