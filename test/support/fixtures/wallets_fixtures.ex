defmodule Wallet.WalletsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Wallet.Wallets` context.
  """

  @doc """
  Generate a wallet_entity.
  """
  def wallet_entity_fixture(attrs \\ %{}) do
    {:ok, wallet_entity} =
      attrs
      |> Enum.into(%{
        amount: "120.5",
        currency: "some currency",
        id: "7488a646-e31f-11e4-aace-600308960662",
        owner_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Wallet.Wallets.create_wallet_entity()

    wallet_entity
  end
end
