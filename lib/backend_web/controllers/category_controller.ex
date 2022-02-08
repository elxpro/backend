defmodule BackendWeb.CategoryController do
  use BackendWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{"hi" => "my first api using elixir"})
  end
end
