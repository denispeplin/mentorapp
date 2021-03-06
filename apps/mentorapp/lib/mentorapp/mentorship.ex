defmodule Mentorapp.Mentorship do
  use Ecto.Schema
  import Ecto.Changeset
  import EctoEnum

  defenum(StatusEnum, :mentorship_status, ~w(requested ongoing finished))

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "mentorships" do
    field :mentor_id, :binary_id
    field :mentee_id, :binary_id
    field :status, StatusEnum

    timestamps()
  end

  @doc false
  def changeset(mentorship, attrs) do
    mentorship
    |> cast(attrs, [])
    |> validate_required([])
  end
end
