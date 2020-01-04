defmodule Mentorapp.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias Mentorapp.Repo

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :accepts_mentees, :boolean, default: false
    field :dev_role, :string
    field :forum_profile, :string
    field :github_id, :integer
    field :nickname, :string
    field :full_name, :string
    field :description, :string
    field :avatar, :string
    field :other_languages, :string
    field :telegram_url, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :full_name,
      :telegram_url,
      :forum_profile,
      :other_languages,
      :dev_role,
      :accepts_mentees
    ])
    |> validate_required([:full_name, :github_id, :accepts_mentees])
  end

  def find_by_id(nil), do: nil

  def find_by_id(user_id) do
    Repo.get(User, user_id)
  end

  def exists?(nil), do: nil
  def exists?(user_id), do: Repo.exists?(User, user_id: user_id)

  def find_by_github_id(nil), do: nil

  def find_by_github_id(github_id) do
    Repo.get_by(User, github_id: github_id)
  end

  def create(basic_info) do
    %User{
      github_id: basic_info.id,
      full_name: basic_info.name,
      nickname: basic_info.nickname,
      description: basic_info.description,
      avatar: basic_info.avatar
    }
    |> Repo.insert!()
  end

  def find_or_create(basic_info) do
    find_by_github_id(basic_info.id) || create(basic_info)
  end

  def update(user, params) do
    user
    |> changeset(params)
    |> Repo.update()
  end
end
