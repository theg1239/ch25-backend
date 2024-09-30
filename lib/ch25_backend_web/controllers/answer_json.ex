defmodule Ch25BackendWeb.AnswerJSON do
  alias Ch25Backend.Answers.Answer

  @doc """
  Renders a list of answers.
  """
  def index(%{answers: answers}) do
    %{data: for(answer <- answers, do: data(answer))}
  end

  @doc """
  Renders a single answer.
  """
  def show(%{answer: answer}) do
    %{data: data(answer)}
  end

  defp data(%Answer{} = answer) do
    %{
      id: answer.id,
      answer: answer.answer,
      points_awarded: answer.points_awarded,
      submitted_at: answer.submitted_at
    }
  end
end
