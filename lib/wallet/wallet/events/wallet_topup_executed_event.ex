defmodule Wallet.Wallet.Events.WalletTopupExecutedEvent do
  @derive Jason.Encoder
  defstruct [:wallet_id, :new_amount]

end
