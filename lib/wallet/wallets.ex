defmodule Wallet.Wallets do
  @moduledoc """
  The Wallets context.
  """

  import Ecto.Query, warn: false
  alias Wallet.Repo

  alias Wallet.Wallets.WalletEntity

  @doc """
  Returns the list of wallets.

  ## Examples

      iex> list_wallets()
      [%WalletEntity{}, ...]

  """
  def list_wallets do
    Repo.all(WalletEntity)
  end

  @doc """
  Gets a single wallet_entity.

  Raises `Ecto.NoResultsError` if the Wallet entity does not exist.

  ## Examples

      iex> get_wallet_entity!(123)
      %WalletEntity{}

      iex> get_wallet_entity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wallet_entity!(id), do: Repo.get!(WalletEntity, id)

  @doc """
  Creates a wallet_entity.

  ## Examples

      iex> create_wallet_entity(%{field: value})
      {:ok, %WalletEntity{}}

      iex> create_wallet_entity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wallet_entity(attrs \\ %{}) do
    %WalletEntity{}
    |> WalletEntity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wallet_entity.

  ## Examples

      iex> update_wallet_entity(wallet_entity, %{field: new_value})
      {:ok, %WalletEntity{}}

      iex> update_wallet_entity(wallet_entity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wallet_entity(%WalletEntity{} = wallet_entity, attrs) do
    wallet_entity
    |> WalletEntity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wallet_entity.

  ## Examples

      iex> delete_wallet_entity(wallet_entity)
      {:ok, %WalletEntity{}}

      iex> delete_wallet_entity(wallet_entity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wallet_entity(%WalletEntity{} = wallet_entity) do
    Repo.delete(wallet_entity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wallet_entity changes.

  ## Examples

      iex> change_wallet_entity(wallet_entity)
      %Ecto.Changeset{data: %WalletEntity{}}

  """
  def change_wallet_entity(%WalletEntity{} = wallet_entity, attrs \\ %{}) do
    WalletEntity.changeset(wallet_entity, attrs)
  end
end
