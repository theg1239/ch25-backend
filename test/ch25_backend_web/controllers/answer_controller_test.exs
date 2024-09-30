defmodule Ch25BackendWeb.AnswerControllerTest do
  use Ch25BackendWeb.ConnCase

  import Ch25Backend.AnswersFixtures

  alias Ch25Backend.Answers.Answer

  @create_attrs %{
    answer: "some answer",
    points_awarded: 42,
    submitted_at: ~U[2024-09-29 11:53:00Z]
  }
  @update_attrs %{
    answer: "some updated answer",
    points_awarded: 43,
    submitted_at: ~U[2024-09-30 11:53:00Z]
  }
  @invalid_attrs %{answer: nil, points_awarded: nil, submitted_at: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all answers", %{conn: conn} do
      conn = get(conn, ~p"/api/answers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create answer" do
    test "renders answer when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/answers", answer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/answers/#{id}")

      assert %{
               "id" => ^id,
               "answer" => "some answer",
               "points_awarded" => 42,
               "submitted_at" => "2024-09-29T11:53:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/answers", answer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update answer" do
    setup [:create_answer]

    test "renders answer when data is valid", %{conn: conn, answer: %Answer{id: id} = answer} do
      conn = put(conn, ~p"/api/answers/#{answer}", answer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/answers/#{id}")

      assert %{
               "id" => ^id,
               "answer" => "some updated answer",
               "points_awarded" => 43,
               "submitted_at" => "2024-09-30T11:53:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, answer: answer} do
      conn = put(conn, ~p"/api/answers/#{answer}", answer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete answer" do
    setup [:create_answer]

    test "deletes chosen answer", %{conn: conn, answer: answer} do
      conn = delete(conn, ~p"/api/answers/#{answer}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/answers/#{answer}")
      end
    end
  end

  defp create_answer(_) do
    answer = answer_fixture()
    %{answer: answer}
  end
end
