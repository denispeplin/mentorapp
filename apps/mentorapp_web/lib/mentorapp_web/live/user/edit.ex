defmodule MentorappWeb.Live.User.Edit do
  use Phoenix.LiveView
  alias MentorappWeb.Router.Helpers, as: Routes
  alias MentorappWeb.{Endpoint, Live, UserView}
  alias Mentorapp.User

  def mount(session, socket) do
    user = User.find_by_id(session.user_id)

    changeset = user |> User.changeset(%{}) |> Map.put(:action, :insert)

    {:ok, assign(socket, user: user, changeset: changeset, params: %{})}
  end

  def render(assigns) do
    UserView.render("edit.html", assigns)
  end

  def handle_event("validate", %{"user" => params}, socket) do
    changeset = socket.assigns.user |> User.changeset(params) |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset, params: params)}
  end

  def handle_event("save", %{"user" => params}, socket) do
    socket.assigns.user
    |> User.update(params)
    |> case do
      {:ok, user} ->
        Endpoint.broadcast!("user:updated:#{user.id}", "message", %{})

        {:stop,
         socket
         |> put_flash(:info, "Profile updated")
         |> redirect(to: Routes.live_path(Endpoint, Live.User.Show))}

      {:error, %Ecto.Changeset{}} ->
        {:noreply, socket}
    end
  end
end
