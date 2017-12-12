# Bernieflanders

Elixir application to take tweets, translate them to as if Ned Flanders himself had tweeted them to a parody account. This project is thoroughly untested, it's a miracle it works at all. See [@bernflanders](https://twitter.com/bernflanders).

## Installation

Note the ENV vars required in config/config.exs

```sh
mix deps.get
```

```sh
iex -S mix
```

```elixir
Bernieflanders.start(:a, :a)
```
