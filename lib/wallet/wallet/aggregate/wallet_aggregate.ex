defmodule Wallet.Wallet.Aggregate.WalletAggregate do
  alias Wallet.Wallet.Events.WalletTopupExecutedEvent
  alias Wallet.Wallet.Commands.TopUpWalletCommand
  alias Wallet.Wallet.Events.WalletCreatedEvent
  alias Wallet.Wallet.Commands.CreateWalletCommand
  alias Wallet.Wallet.Aggregate.WalletAggregate

  defstruct [:id, :owner_id, :amount, :currency]

  def execute(%WalletAggregate{id: nil}, %CreateWalletCommand{
        id: id,
        owner_id: owner_id,
        amount: amount,
        currency: currency
      })
      when amount >= 0 do
    %WalletCreatedEvent{id: id, owner_id: owner_id, amount: amount, currency: currency}
  end

  def execute(%WalletAggregate{}, %CreateWalletCommand{
        amount: amount
      })
      when amount < 0 do
    {:error, :invalid_amount_negative}
  end

  def execute(
        %WalletAggregate{},
        %TopUpWalletCommand{id: id, amount: amount, currency: currency}
      )
      when amount <= 0 do
    {:error, :invalid_amount_must_be_above_zero}
  end

  def execute(
        %WalletAggregate{
          id: wallet_id,
          owner_id: wallet_owner_id,
          amount: wallet_amount,
          currency: wallet_currency
        },
        %TopUpWalletCommand{currency: currency}
      )
      when currency != wallet_currency do
    {:error, :invalid_currency_mismatch}
  end

  def execute(
        %WalletAggregate{} = wallet,
        %TopUpWalletCommand{amount: amount}
      ) do
    %WalletTopupExecutedEvent{
      wallet_id: wallet.id,
      new_amount: amount + wallet.amount
    }
  end

  def apply(%WalletAggregate{} = wallet, %WalletCreatedEvent{} = event) do
    %WalletAggregate{
      wallet
      | id: event.id,
        owner_id: event.owner_id,
        amount: event.amount,
        currency: event.currency
    }
  end

  def apply(%WalletAggregate{} = wallet, %WalletTopupExecutedEvent{} = event) do
    %WalletAggregate{
      wallet |
      amount: event.new_amount
    }
  end
end
