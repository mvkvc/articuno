defmodule Freeze do
  import NimbleSchool.Blog

  def get_urls() do
    index = ""
    blog = "/blog"

    posts =
      all_posts()
      |> Enum.map(fn post -> post.id end)
      |> Enum.map(fn id -> blog <> "/" <> id end)

    urls = [index, blog] ++ posts
    urls |> IO.inspect(label: "urls")
    urls
  end
end

Freeze.get_urls()
