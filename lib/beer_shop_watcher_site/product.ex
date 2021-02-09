defmodule BeerShopWatcherSite.Product do
  use Ecto.Schema
  @timestamps_opts inserted_at: :created_at

  import Ecto.Changeset

  schema "products" do
    field :count, :integer
    field :inner_text, :string
    field :name, :string
    field :url, :string
    field :xpath, :map
    field :product_type_id, :id

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:url, :xpath, :name, :inner_text, :count])
    |> validate_required([:url, :xpath, :name, :inner_text, :count])
  end
end
