defmodule BackendWeb.CategoryControllerTest do
  use BackendWeb.ConnCase

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

      assert %{"id" => ^id, "name" => "Sport", "description" => "pumpkin"} =
               json_response(conn, 200)
    end
  end
end
