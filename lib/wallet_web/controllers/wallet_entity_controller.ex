defmodule WalletWeb.WalletEntityController do
  use WalletWeb, :controller

  alias Wallet.Wallets
  alias Wallet.Wallets.WalletEntity

  action_fallback WalletWeb.FallbackController

  def index(conn, _params) do
    wallets = Wallets.list_wallets()
    render(conn, :index, wallets: wallets)
  end

  def create(conn, %{"wallet_entity" => wallet_entity_params}) do
    with {:ok, %WalletEntity{} = wallet_entity} <- Wallets.create_wallet_entity(wallet_entity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/wallets/#{wallet_entity}")
      |> render(:show, wallet_entity: wallet_entity)
    end
  end

  def show(conn, %{"id" => id}) do
    wallet_entity = Wallets.get_wallet_entity!(id)
    render(conn, :show, wallet_entity: wallet_entity)
  end

  def update(conn, %{"id" => id, "wallet_entity" => wallet_entity_params}) do
    wallet_entity = Wallets.get_wallet_entity!(id)

    with {:ok, %WalletEntity{} = wallet_entity} <- Wallets.update_wallet_entity(wallet_entity, wallet_entity_params) do
      render(conn, :show, wallet_entity: wallet_entity)
    end
  end

  def delete(conn, %{"id" => id}) do
    wallet_entity = Wallets.get_wallet_entity!(id)

    with {:ok, %WalletEntity{}} <- Wallets.delete_wallet_entity(wallet_entity) do
      send_resp(conn, :no_content, "")
    end
  end
end
