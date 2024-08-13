defmodule Wallet.Wallet.Commands.CreateWalletCommand do
  defstruct [:id, :owner_id, :amount, :currency]

  use ExConstructor
  alias Wallet.Wallet.Commands.CreateWalletCommand

  def assign_id(%CreateWalletCommand{} = command) do

    %CreateWalletCommand{
      command
      | id: Ecto.UUID.generate()
    }
  end

end
