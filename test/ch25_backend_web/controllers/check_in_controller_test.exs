defmodule Ch25BackendWeb.CheckInControllerTest do
  use Ch25BackendWeb.ConnCase

  import Ch25Backend.CheckInsFixtures

  alias Ch25Backend.CheckIns.CheckIn

  @create_attrs %{
    checked_in_at: ~U[2024-09-29 11:53:00Z]
  }
  @update_attrs %{
    checked_in_at: ~U[2024-09-30 11:53:00Z]
  }
  @invalid_attrs %{checked_in_at: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all check_ins", %{conn: conn} do
      conn = get(conn, ~p"/api/check_ins")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create check_in" do
    test "renders check_in when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/check_ins", check_in: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/check_ins/#{id}")

      assert %{
               "id" => ^id,
               "checked_in_at" => "2024-09-29T11:53:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/check_ins", check_in: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update check_in" do
    setup [:create_check_in]

    test "renders check_in when data is valid", %{conn: conn, check_in: %CheckIn{id: id} = check_in} do
      conn = put(conn, ~p"/api/check_ins/#{check_in}", check_in: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/check_ins/#{id}")

      assert %{
               "id" => ^id,
               "checked_in_at" => "2024-09-30T11:53:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, check_in: check_in} do
      conn = put(conn, ~p"/api/check_ins/#{check_in}", check_in: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete check_in" do
    setup [:create_check_in]

    test "deletes chosen check_in", %{conn: conn, check_in: check_in} do
      conn = delete(conn, ~p"/api/check_ins/#{check_in}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/check_ins/#{check_in}")
      end
    end
  end

  defp create_check_in(_) do
    check_in = check_in_fixture()
    %{check_in: check_in}
  end
end
