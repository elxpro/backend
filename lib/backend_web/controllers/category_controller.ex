defmodule BackendWeb.CategoryController do
  use BackendWeb, :controller
  alias Backend.Categories

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    categories = Categories.all()

    conn
    |> put_status(:ok)
    |> render("index.json", categories: categories)
  end

  def show(conn, %{"id" => id}) do
    category = Categories.show(id)
    render(conn, "show.json", category: category)
  end

  def create(conn, %{"category" => category}) do
    with {:ok, category} <- Categories.create(category) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.category_path(conn, :show, category))
      |> render("show.json", category: category)
    end
  end
end
