defmodule Mentorapp.Repo.Migrations.CreateMentorships do
  use Ecto.Migration

  def change do
    create table(:mentorships, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :mentor_id, references(:users, on_delete: :nothing, type: :binary_id), null: false
      add :mentee_id, references(:users, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:mentorships, [:mentor_id])
    create index(:mentorships, [:mentee_id])
  end
end
