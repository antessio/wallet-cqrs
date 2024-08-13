defmodule Wallet.Wallet.Aggregate.WalletAggregate do
  alias Wallet.Wallet.Events.WalletCreatedEvent
  alias Wallet.Wallet.Commands.CreateWalletCommand
  alias Wallet.Wallet.Aggregate.WalletAggregate

  defstruct [:id, :owner_id, :amount, :currency]


  def execute(%WalletAggregate{id: nil}, %CreateWalletCommand{id: id, owner_id: owner_id, amount: amount, currency: currency})
     when amount >= 0
   do
     %WalletCreatedEvent{id: id, owner_id: owner_id, amount: amount, currency: currency}
   end

   def execute(%WalletAggregate{}, %CreateWalletCommand{id: id, owner_id: owner_id, amount: amount, currency: currency})
     when amount < 0
   do
     {:error, :invalid_amount_negative}
   end

   def apply(%WalletAggregate{} = wallet, %WalletCreatedEvent{} = event) do
    %WalletAggregate{wallet | id: event.id, owner_id: event.owner_id, amount: event.amount, currency: event.currency}
   end


end
