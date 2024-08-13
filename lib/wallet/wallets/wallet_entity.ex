defmodule Wallet.Wallets.WalletEntity do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "wallets" do
    field :currency, :string
    field :owner_id, Ecto.UUID
    field :amount, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(wallet_entity, attrs) do
    wallet_entity
    |> cast(attrs, [:id, :owner_id, :amount, :currency])
    |> validate_required([:id, :owner_id, :amount, :currency])
  end
end
