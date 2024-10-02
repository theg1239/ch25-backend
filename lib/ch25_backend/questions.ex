defmodule Ch25Backend.Questions do
  @moduledoc """
  The Questions context.
  """

  import Ecto.Query, warn: false
  alias Ch25Backend.Repo
  alias Ch25Backend.Questions.Question
  alias Ch25Backend.Accounts.User

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{data: %Question{}}

  """
  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end

  @doc """
  Returns the leaderboard.

  ## Examples

      iex> get_leaderboard()
      [%{id: 1, name: "Alice", points: 100}, ...]

  """
  def get_leaderboard do
    from(u in User,
      join: a in assoc(u, :answers),
      group_by: u.id,
      select: %{id: u.id, name: u.name, points: sum(a.points_awarded)},
      order_by: [desc: sum(a.points_awarded)],
      limit: 100
    )
    |> Repo.all()
  end
end
