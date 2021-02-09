defmodule BeerShopWatcherSiteWeb.PageController do
  use BeerShopWatcherSiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
