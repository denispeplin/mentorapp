defmodule Mentorapp.Repo.Migrations.AddStatusToMentorships do
  use Ecto.Migration
  alias Mentorapp.Mentorship

  def change do
    Mentorship.StatusEnum.create_type()

    alter table(:mentorships) do
      add :status, Mentorship.StatusEnum.type()
    end
  end
end
