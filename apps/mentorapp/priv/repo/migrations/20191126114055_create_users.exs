defmodule Mentorapp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :full_name, :string
      add :github_id, :bigint, null: false
      add :nickname, :string
      add :description, :text
      add :avatar, :string
      add :telegram_url, :string
      add :forum_profile, :string
      add :other_languages, :string
      add :dev_role, :string
      add :accepts_mentees, :boolean, default: false, null: false

      timestamps()
    end

    create index(:users, :github_id, unique: true)
  end
end
