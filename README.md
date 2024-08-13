# Wallet

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

# Commanded refs

[Getting started commanded] (https://hexdocs.pm/commanded/getting-started.html)
[Event store adapter](https://github.com/commanded/commanded-eventstore-adapter/blob/master/guides/Getting%20Started.md)

#### projections

[ecto-projections-adapter](https://github.com/commanded/commanded-ecto-projections/blob/master/guides/Getting%20Started.md)


```
$ mix ecto.gen.migration create_projection_versions
$ mix ecto.migrate

```