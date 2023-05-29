# articuno

[![docs](https://github.com/mvkvc/articuno/actions/workflows/docs.yaml/badge.svg)](https://github.com/mvkvc/articuno/actions/workflows/docs.yaml)

Freeze your Phoenix web application into a static site.

This library can be used for any Phoenix application that serves static content. It was inspired by [Frozen-Flask](https://github.com/Frozen-Flask/Frozen-Flask) and first created to deploy a [NimblePublisher](https://github.com/dashbitco/nimble_publisher) blog as a static site. There is a demo site available [here](https://github.com/mvkvc/articuno_demo).

For more information see the [documentation](https://mvkvc.github.io/articuno).

## Installation

Add `articuno` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:articuno, git: "https://github.com/mvkvc/articuno.git"}
  ]
end
```

## Usage

- `mix freeze.init` to generate the config file which contains a function the user needs to implement that returns the routes to freeze.
- `mix freeze` to generate the static site, by default in `_freeze`.
- `mix freeze.serve` to serve the static site, by default at `localhost:3000`.
