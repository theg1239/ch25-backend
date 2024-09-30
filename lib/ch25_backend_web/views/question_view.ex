defmodule Ch25BackendWeb.QuestionView do
  use Ch25BackendWeb, :view
  alias Ch25BackendWeb.QuestionView

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{
      id: question.id,
      title: question.title,
      description: question.description,
      qr_code: question.qr_code,
      answer_type: question.answer_type,
      points: question.points,
      phase: question.phase
    }
  end
end
