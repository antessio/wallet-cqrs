defmodule Wallet.CommandedRouter do
  alias Wallet.Wallet.Commands.TopUpWalletCommand
  alias Wallet.Wallet.Aggregate.WalletAggregate
  alias Wallet.Wallet.Commands.CreateWalletCommand
  use Commanded.Commands.Router

   dispatch [CreateWalletCommand, TopUpWalletCommand], to: WalletAggregate, identity: :id

end
