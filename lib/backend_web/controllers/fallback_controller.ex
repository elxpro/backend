defmodule BackendWeb.FallbackController do
  use BackendWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(BackendWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end
end
