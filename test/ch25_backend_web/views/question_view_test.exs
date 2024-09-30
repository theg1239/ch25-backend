defmodule Ch25BackendWeb.QuestionViewTest do
  use Ch25BackendWeb.ConnCase, async: true
  alias Ch25BackendWeb.QuestionView

  test "renders question.json" do
    question = %{
      id: 1,
      title: "Sample Question",
      description: "This is a sample.",
      qr_code: "QR123",
      answer_type: "string",
      points: 10,
      phase: 1
    }

    expected = %{
      id: 1,
      title: "Sample Question",
      description: "This is a sample.",
      qr_code: "QR123",
      answer_type: "string",
      points: 10,
      phase: 1
    }

    assert QuestionView.render("question.json", %{question: question}) == expected
  end
end
