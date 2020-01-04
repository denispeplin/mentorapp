defmodule MentorappWeb.Router do
  use MentorappWeb, :router
  import Phoenix.LiveView.Router
  alias MentorappWeb.Plug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :check_user do
    plug Plug.CheckUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MentorappWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", MentorappWeb do
    pipe_through [:browser, :check_user]

    live "/user", Live.User.Edit, session: [:user_id]
  end

  scope "/auth", Mentorapp do
    pipe_through([:browser])

    get("/github", AuthController, :request)
    get("/github/callback", AuthController, :callback)
    post("/logout", AuthController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", MentorappWeb do
  #   pipe_through :api
  # end
end
