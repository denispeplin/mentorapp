# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :mentorapp,
  ecto_repos: [Mentorapp.Repo]

config :mentorapp_web,
  ecto_repos: [Mentorapp.Repo],
  generators: [context_app: :mentorapp, binary_id: true]

# Configures the endpoint
config :mentorapp_web, MentorappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: MentorappWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MentorappWeb.PubSub, adapter: Phoenix.PubSub.PG2]

config :mentorapp_web, MentorappWeb.Endpoint,
  live_view: [
    signing_salt: "oRToewIgYXgQVx3XEThLg3g0rADkU0Mh"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
