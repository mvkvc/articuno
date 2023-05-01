defmodule Freeze do
  import NimbleSchool.Blog

  def get_urls() do
    index = ""
    blog = "/blog"

    posts =
      all_posts()
      |> Enum.map(fn post -> post.id end)
      |> Enum.map(fn id -> blog <> "/" <> id end)

    [index, blog] ++ posts
  end
end

Freeze.get_urls()
