defmodule MentorappWeb.Live.User.Show do
  use Phoenix.LiveView
  alias MentorappWeb.UserView
  alias Mentorapp.User

  def mount(session, socket) do
    user = User.find_by_id(session.user_id)

    if connected?(socket) do
      Phoenix.PubSub.subscribe(MentorappWeb.PubSub, "user:updated:#{session.user_id}")
    end

    {:ok, assign(socket, user: user)}
  end

  def render(assigns) do
    UserView.render("show.html", assigns)
  end

  def handle_info(%Phoenix.Socket.Broadcast{event: "message"}, socket) do
    user = User.find_by_id(socket.assigns.user.id)

    {:noreply, assign(socket, user: user)}
  end
end
