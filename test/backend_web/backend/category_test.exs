defmodule Backend.CategoriesTest do
  use Backend.DataCase
  alias Backend.Categories
  alias Backend.Categories.Category

  test "when call list categories should return all" do
    assert Categories.all() == []
  end

  test "given a payload from a category that already when call create/1 then throw an error message" do
    payload = %{
      name: "Sport",
      description: "pumpkin"
    }

    assert {:ok, %Category{} = _category} = Categories.create(payload)
    assert {:error, changeset} = Categories.create(payload)
    assert "has already been taken" in errors_on(changeset).name
    assert %{name: ["has already been taken"]} = errors_on(changeset)
  end

  test "given a payload when call create/1 then create a category" do
    payload = %{
      name: "Sport",
      description: "pumpkin"
    }

    assert {:ok, %Category{} = category} = Categories.create(payload)
    assert category.name == String.upcase(payload.name)
    assert category.description == payload.description
  end
end
