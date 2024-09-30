defmodule Ch25BackendWeb.QuestionJSON do
  alias Ch25Backend.Questions.Question

  @doc """
  Renders a list of questions.
  """
  def index(%{questions: questions}) do
    %{data: for(question <- questions, do: data(question))}
  end

  @doc """
  Renders a single question.
  """
  def show(%{question: question}) do
    %{data: data(question)}
  end

  defp data(%Question{} = question) do
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
