defmodule Ch25BackendWeb.AnswerViewTest do
  use Ch25BackendWeb.ConnCase, async: true
  alias Ch25BackendWeb.AnswerView

  test "renders answer.json" do
    answer = %{
      id: 1,
      answer: "Correct Answer",
      points_awarded: 10,
      submitted_at: ~U[2024-09-30 17:15:00Z],
      user_id: 1,
      question_id: 1
    }

    expected = %{
      id: 1,
      answer: "Correct Answer",
      points_awarded: 10,
      submitted_at: ~U[2024-09-30 17:15:00Z],
      user_id: 1,
      question_id: 1
    }

    assert AnswerView.render("answer.json", %{answer: answer}) == expected
  end
end
    