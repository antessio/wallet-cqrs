defmodule Wallet.Wallets.Projectors.WalletProjector do
  alias Wallet.Repo
  alias Wallet.Wallet.Events.WalletTopupExecutedEvent
  alias Wallet.Wallets.WalletEntity
  alias Wallet.Wallet.Events.WalletCreatedEvent

  use Commanded.Projections.Ecto,
    application: Wallet.Application,
    name: "WalletProjector"

  project %WalletCreatedEvent{} = event, _metadata do
    Ecto.Multi.insert(multi, :wallets, %WalletEntity{
      id: event.id,
      owner_id: event.owner_id,
      amount: event.amount,
      currency: event.currency
    })
  end

  project %WalletTopupExecutedEvent{} = event, _metadata do
    case Repo.get(WalletEntity, event.wallet_id) do
      nil -> multi
      item -> Ecto.Multi.update(multi, :wallets, WalletEntity.changeset(item, %{amount: event.new_amount}))
    end
  end
end
