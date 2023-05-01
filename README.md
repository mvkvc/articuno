# articuno

[![deploy](https://github.com/mvkvc/articuno/actions/workflows/deploy.yaml/badge.svg?branch=main)](https://github.com/mvkvc/articuno/actions/workflows/deploy.yaml)

Freeze your Phoenix web application into a static site.

This library can be used for any Phoenix application that doesn't need to be dynamic such as a blog. I created it so that I could host a NimblePublisher blog on a static host such as GitHub Pages. The example site is hosted at: <https://articuno-demo.netlify.app>.

## Installation

Add `articuno` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:articuno, git: "https://github.com/mvkvc/articuno.git", subdir: "articuno"}
  ]
end
```

## Usage

- `mix freeze.init` to generate the config file which contains a function the user needs to implement that returns the routes to freeze.
- `mix freeze` to generate the static site, by default in `_freeze`.
- `mix freeze.serve` to serve the static site, by default at `localhost:3000`.

## Folder structure

- `articuno` is the library.
- `nimble_school` is an example application for testing.
