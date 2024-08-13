defmodule Wallet.Wallet.Events.WalletCreatedEvent do
  @derive Jason.Encoder
  defstruct [:id, :owner_id, :amount, :currency]
end
