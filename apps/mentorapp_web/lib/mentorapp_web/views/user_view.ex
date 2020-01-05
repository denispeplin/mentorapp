defmodule MentorappWeb.UserView do
  use MentorappWeb, :view

  def get_field(changeset, params, key) do
    if params[Atom.to_string(key)] == "" do
      ""
    else
      Ecto.Changeset.get_field(changeset, key)
    end
  end
end
