defmodule Wallet.WalletsTest do
  use Wallet.DataCase

  alias Wallet.Wallets

  describe "wallets" do
    alias Wallet.Wallets.WalletEntity

    import Wallet.WalletsFixtures

    @invalid_attrs %{id: nil, currency: nil, owner_id: nil, amount: nil}

    test "list_wallets/0 returns all wallets" do
      wallet_entity = wallet_entity_fixture()
      assert Wallets.list_wallets() == [wallet_entity]
    end

    test "get_wallet_entity!/1 returns the wallet_entity with given id" do
      wallet_entity = wallet_entity_fixture()
      assert Wallets.get_wallet_entity!(wallet_entity.id) == wallet_entity
    end

    test "create_wallet_entity/1 with valid data creates a wallet_entity" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", currency: "some currency", owner_id: "7488a646-e31f-11e4-aace-600308960662", amount: "120.5"}

      assert {:ok, %WalletEntity{} = wallet_entity} = Wallets.create_wallet_entity(valid_attrs)
      assert wallet_entity.id == "7488a646-e31f-11e4-aace-600308960662"
      assert wallet_entity.currency == "some currency"
      assert wallet_entity.owner_id == "7488a646-e31f-11e4-aace-600308960662"
      assert wallet_entity.amount == Decimal.new("120.5")
    end

    test "create_wallet_entity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wallets.create_wallet_entity(@invalid_attrs)
    end

    test "update_wallet_entity/2 with valid data updates the wallet_entity" do
      wallet_entity = wallet_entity_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", currency: "some updated currency", owner_id: "7488a646-e31f-11e4-aace-600308960668", amount: "456.7"}

      assert {:ok, %WalletEntity{} = wallet_entity} = Wallets.update_wallet_entity(wallet_entity, update_attrs)
      assert wallet_entity.id == "7488a646-e31f-11e4-aace-600308960668"
      assert wallet_entity.currency == "some updated currency"
      assert wallet_entity.owner_id == "7488a646-e31f-11e4-aace-600308960668"
      assert wallet_entity.amount == Decimal.new("456.7")
    end

    test "update_wallet_entity/2 with invalid data returns error changeset" do
      wallet_entity = wallet_entity_fixture()
      assert {:error, %Ecto.Changeset{}} = Wallets.update_wallet_entity(wallet_entity, @invalid_attrs)
      assert wallet_entity == Wallets.get_wallet_entity!(wallet_entity.id)
    end

    test "delete_wallet_entity/1 deletes the wallet_entity" do
      wallet_entity = wallet_entity_fixture()
      assert {:ok, %WalletEntity{}} = Wallets.delete_wallet_entity(wallet_entity)
      assert_raise Ecto.NoResultsError, fn -> Wallets.get_wallet_entity!(wallet_entity.id) end
    end

    test "change_wallet_entity/1 returns a wallet_entity changeset" do
      wallet_entity = wallet_entity_fixture()
      assert %Ecto.Changeset{} = Wallets.change_wallet_entity(wallet_entity)
    end
  end
end
