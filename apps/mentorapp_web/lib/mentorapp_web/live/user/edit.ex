defmodule MentorappWeb.Live.User.Edit do
  use Phoenix.LiveView
  alias MentorappWeb.Router.Helpers, as: Routes
  alias MentorappWeb.UserView
  alias MentorappWeb.Live
  alias Mentorapp.User

  def mount(session, socket) do
    user = User.find_by_id(session.user_id)

    changeset = user |> User.changeset(%{}) |> Map.put(:action, :insert)

    {:ok, assign(socket, user: user, changeset: changeset)}
  end

  def render(assigns) do
    UserView.render("edit.html", assigns)
  end

  def handle_event("validate", %{"user" => params}, socket) do
    changeset = socket.assigns.user |> User.changeset(params) |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"user" => params}, socket) do
    socket.assigns.user
    |> User.update(params)
    |> case do
      {:ok, _user} ->
        {:stop,
         socket
         |> put_flash(:info, "Profile updated")
         |> redirect(to: Routes.live_path(MentorappWeb.Endpoint, Live.User.Edit))}

      {:error, %Ecto.Changeset{}} ->
        {:noreply, socket}
    end
  end
end
