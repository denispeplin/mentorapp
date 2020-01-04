defmodule MentorappWeb.Live.User.Show do
  use Phoenix.LiveView
  alias MentorappWeb.UserView
  alias Mentorapp.User

  def mount(session, socket) do
    user = User.find_by_id(session.user_id)

    {:ok, assign(socket, user: user)}
  end

  def render(assigns) do
    UserView.render("show.html", assigns)
  end
end
