defmodule Ch25BackendWeb.AnswerView do
  use Ch25BackendWeb, :view
  alias Ch25BackendWeb.AnswerView

  def render("index.json", %{answers: answers}) do
    %{data: render_many(answers, AnswerView, "answer.json")}
  end

  def render("show.json", %{answer: answer}) do
    %{data: render_one(answer, AnswerView, "answer.json")}
  end

  def render("answer.json", %{answer: answer}) do
    %{
      id: answer.id,
      answer: answer.answer,
      points_awarded: answer.points_awarded,
      submitted_at: answer.submitted_at,
      user_id: answer.user_id,
      question_id: answer.question_id
    }
  end
end
