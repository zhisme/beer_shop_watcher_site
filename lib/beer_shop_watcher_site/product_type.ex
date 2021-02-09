defmodule BeerShopWatcherSite.ProductType do
  use Ecto.Schema
  @timestamps_opts inserted_at: :created_at

  import Ecto.Changeset

  schema "product_types" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(product_type, attrs) do
    product_type
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
    |> unique_constraint(:slug)
  end
end
