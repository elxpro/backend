defmodule BackendWeb.CategoryControllerTest do
  use BackendWeb.ConnCase
  alias Backend.Categories

  describe "categories" do
    test "list all categories", %{conn: conn} do
      conn = get(conn, Routes.category_path(conn, :index))
      assert json_response(conn, 200) == []
    end

    test "given a payload create a category", %{conn: conn} do
      category = %{name: "Sport", description: "pumpkin"}
      conn = post(conn, Routes.category_path(conn, :create, category: category))

      assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, Routes.category_path(conn, :show, id))

      assert %{"id" => ^id, "name" => "SPORT", "description" => "pumpkin"} =
               json_response(conn, 200)
    end

    test "given a category payload that already should throw an error message", %{conn: conn} do
      category = %{name: "Sport", description: "pumpkin"}
      Categories.create(category)

      conn = post(conn, Routes.category_path(conn, :create, category: category))
      assert "has already been taken" in json_response(conn, 422)["errors"]["name"]
    end
  end
end
