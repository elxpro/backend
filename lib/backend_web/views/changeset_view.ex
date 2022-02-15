defmodule BackendWeb.ChangesetView do
  use BackendWeb, :view

  def render("error.json", %{changeset: changeset}) do
    errors = Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
    %{errors: errors}
  end
end
