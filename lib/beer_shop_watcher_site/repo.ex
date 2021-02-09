defmodule BeerShopWatcherSite.Repo do
  use Ecto.Repo,
    otp_app: :beer_shop_watcher_site,
    adapter: Ecto.Adapters.Postgres
end
