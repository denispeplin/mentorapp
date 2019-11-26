defmodule Mentorapp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :full_name, :string, null: false
      add :github_user, :string, mull: false
      add :telegram_url, :string, null: false
      add :forum_profile, :string
      add :other_languages, :string
      add :dev_role, :string
      add :accepts_mentees, :boolean, default: false, null: false

      timestamps()
    end
  end
end
