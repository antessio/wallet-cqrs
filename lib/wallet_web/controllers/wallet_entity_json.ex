defmodule WalletWeb.WalletEntityJSON do
  alias Wallet.Wallets.WalletEntity

  @doc """
  Renders a list of wallets.
  """
  def index(%{wallets: wallets}) do
    %{data: for(wallet_entity <- wallets, do: data(wallet_entity))}
  end

  @doc """
  Renders a single wallet_entity.
  """
  def show(%{wallet_entity: wallet_entity}) do
    %{data: data(wallet_entity)}
  end

  defp data(%WalletEntity{} = wallet_entity) do
    %{
      id: wallet_entity.id,
      id: wallet_entity.id,
      owner_id: wallet_entity.owner_id,
      amount: wallet_entity.amount,
      currency: wallet_entity.currency
    }
  end
end
