defmodule BackendWeb.CategoryView do
  use BackendWeb, :view

  def render("index.json", %{categories: categories}) do
    render_many(categories, __MODULE__, "category.json")
  end

  def render("show.json", %{category: category}) do
    render_one(category, __MODULE__, "category.json")
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      name: category.name,
      description: category.description
    }
  end
end
