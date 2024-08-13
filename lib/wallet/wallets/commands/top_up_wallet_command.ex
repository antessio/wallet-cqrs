defmodule Wallet.Wallet.Commands.TopUpWalletCommand do
  defstruct [:id, :amount, :currency]

  use ExConstructor

end
