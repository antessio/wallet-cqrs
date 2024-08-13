defmodule WalletWeb.WalletEntityControllerTest do
  use WalletWeb.ConnCase


  import Wallet.WalletsFixtures

  alias Wallet.Wallets.WalletEntity

  @create_attrs %{
    id: "7488a646-e31f-11e4-aace-600308960662",
    currency: "some currency",
    owner_id: "7488a646-e31f-11e4-aace-600308960662",
    amount: "120.5"
  }
  @update_attrs %{
    id: "7488a646-e31f-11e4-aace-600308960668",
    currency: "some updated currency",
    owner_id: "7488a646-e31f-11e4-aace-600308960668",
    amount: "456.7"
  }
  @invalid_attrs %{id: nil, currency: nil, owner_id: nil, amount: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
  @tag :skip
  describe "index" do
    test "lists all wallets", %{conn: conn} do
      conn = get(conn, ~p"/api/wallets")
      assert json_response(conn, 200)["data"] == []
    end
  end
  describe "create wallet_entity" do
    @tag :skip
    test "renders wallet_entity when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/wallets", wallet_entity: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/wallets/#{id}")

      assert %{
               "id" => ^id,
               "amount" => "120.5",
               "currency" => "some currency",
               "owner_id" => "7488a646-e31f-11e4-aace-600308960662"
             } = json_response(conn, 200)["data"]
    end
    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/wallets", wallet_entity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
  describe "update wallet_entity" do
    setup [:create_wallet_entity]

    @tag :skip
    test "renders wallet_entity when data is valid", %{conn: conn, wallet_entity: %WalletEntity{id: id} = wallet_entity} do
      conn = put(conn, ~p"/api/wallets/#{wallet_entity}", wallet_entity: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/wallets/#{id}")

      assert %{
               "id" => ^id,
               "amount" => "456.7",
               "currency" => "some updated currency",
               "owner_id" => "7488a646-e31f-11e4-aace-600308960668"
             } = json_response(conn, 200)["data"]
    end
    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, wallet_entity: wallet_entity} do
      conn = put(conn, ~p"/api/wallets/#{wallet_entity}", wallet_entity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
  describe "delete wallet_entity" do
    setup [:create_wallet_entity]

    @tag :skip
    test "deletes chosen wallet_entity", %{conn: conn, wallet_entity: wallet_entity} do
      conn = delete(conn, ~p"/api/wallets/#{wallet_entity}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/wallets/#{wallet_entity}")
      end
    end
  end

  defp create_wallet_entity(_) do
    wallet_entity = wallet_entity_fixture()
    %{wallet_entity: wallet_entity}
  end
end
