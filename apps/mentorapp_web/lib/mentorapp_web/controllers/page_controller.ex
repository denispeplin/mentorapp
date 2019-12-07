defmodule MentorappWeb.PageController do
  use MentorappWeb, :controller
  alias Mentorapp.User

  def index(conn, _params) do
    user =
      get_session(conn, :user_id)
      |> User.find_by_id()

    render(conn, "index.html", current_user: user)
  end
end
