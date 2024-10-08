defmodule Wallet.CommandedApplication do
  use Commanded.Application,
    otp_app: :wallet,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: Wallet.EventStore
    ]

    router Wallet.CommandedRouter

    def init(config) do
      {:ok, config}
    end
end
