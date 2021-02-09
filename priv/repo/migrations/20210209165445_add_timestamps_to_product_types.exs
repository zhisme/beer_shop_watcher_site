defmodule BeerShopWatcherSite.Repo.Migrations.AddTimestampsToProductTypes do
  use Ecto.Migration

  def change do
    alter table("product_types") do
      timestamps(inserted_at: false, default: "2021-02-09 00:00:01")
    end
  end
end
