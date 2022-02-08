defmodule BackendWeb.CategoryController do
  use BackendWeb, :controller
  alias Backend.Categories

  def index(conn, _params) do
    categories = Categories.all()

    conn
    |> put_status(:ok)
    |> render("index.json", categories: categories)
  end
end
