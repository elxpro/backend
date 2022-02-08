defmodule Backend.Categories do
  alias Backend.Repo
  alias Backend.Categories.Category

  def all do
    Repo.all(Category)
  end
end
