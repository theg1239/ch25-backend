defmodule Ch25BackendWeb.QuestionControllerTest do
  use Ch25BackendWeb.ConnCase

  alias Ch25Backend.Questions
  alias Ch25Backend.Questions.Question

  @create_attrs %{title: "New Question", description: "Description", qr_code: "QR456", answer_type: "qr", points: 20, phase: 2}
  @invalid_attrs %{title: nil, description: nil, qr_code: nil, answer_type: nil, points: nil, phase: nil}

  test "creates question and renders question when data is valid", %{conn: conn} do
    conn = post(conn, Routes.question_path(conn, :create), question: @create_attrs)
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get(conn, Routes.question_path(conn, :show, id))
    assert %{
             "id" => id,
             "title" => "New Question",
             "description" => "Description",
             "qr_code" => "QR456",
             "answer_type" => "qr",
             "points" => 20,
             "phase" => 2
           } = json_response(conn, 200)["data"]
  end

  test "does not create question and renders errors when data is invalid", %{conn: conn} do
    conn = post(conn, Routes.question_path(conn, :create), question: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end
end
