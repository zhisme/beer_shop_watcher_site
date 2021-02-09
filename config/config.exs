# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :beer_shop_watcher_site, BeerShopWatcherSite.Products,
  database: "beer_shop_watcher_site_products",
  username: "root",
  password: "",
  hostname: "localhost"

config :beer_shop_watcher_site,
  ecto_repos: [BeerShopWatcherSite.Repo]

# Configures the endpoint
config :beer_shop_watcher_site, BeerShopWatcherSiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y/FXA1lFx02pj8rlARZfN2PAzj/XO0QVm6MN/Din8jZidWGJUZukg1hGgeGvYgAD",
  render_errors: [view: BeerShopWatcherSiteWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BeerShopWatcherSite.PubSub,
  live_view: [signing_salt: "tOic827M"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
