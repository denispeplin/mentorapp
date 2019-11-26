defmodule Mentorapp.Repo do
  use Ecto.Repo,
    otp_app: :mentorapp,
    adapter: Ecto.Adapters.Postgres
end
