defmodule Wallet.CommandedRouter do
  alias Wallet.Wallet.Aggregate.WalletAggregate
  alias Wallet.Wallet.Commands.CreateWalletCommand
  use Commanded.Commands.Router

   dispatch CreateWalletCommand, to: WalletAggregate, identity: :id

end
