defmodule MentorappWeb.Plug.CheckUser do
  import Plug.Conn
  import Phoenix.Controller
  alias MentorappWeb.Router.Helpers, as: Routes
  alias Mentorapp.User

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)

    if User.exists?(user_id) do
      conn
    else
      conn
      |> put_flash(:info, "Log in to access profile")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
