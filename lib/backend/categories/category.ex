defmodule Backend.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @field ~w/name description/a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @field)
    |> validate_required(@field)
    |> update_change(:name, &String.upcase/1)
    |> unique_constraint(:name)
  end
end
