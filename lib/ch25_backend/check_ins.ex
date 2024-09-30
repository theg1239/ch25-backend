defmodule Ch25Backend.CheckIns do
  @moduledoc """
  The CheckIns context.
  """

  import Ecto.Query, warn: false
  alias Ch25Backend.Repo

  alias Ch25Backend.CheckIns.CheckIn

  @doc """
  Returns the list of check_ins.

  ## Examples

      iex> list_check_ins()
      [%CheckIn{}, ...]

  """
  def list_check_ins do
    Repo.all(CheckIn)
  end

  @doc """
  Gets a single check_in.

  Raises `Ecto.NoResultsError` if the Check in does not exist.

  ## Examples

      iex> get_check_in!(123)
      %CheckIn{}

      iex> get_check_in!(456)
      ** (Ecto.NoResultsError)

  """
  def get_check_in!(id), do: Repo.get!(CheckIn, id)

  @doc """
  Creates a check_in.

  ## Examples

      iex> create_check_in(%{field: value})
      {:ok, %CheckIn{}}

      iex> create_check_in(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_check_in(attrs \\ %{}) do
    %CheckIn{}
    |> CheckIn.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a check_in.

  ## Examples

      iex> update_check_in(check_in, %{field: new_value})
      {:ok, %CheckIn{}}

      iex> update_check_in(check_in, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_check_in(%CheckIn{} = check_in, attrs) do
    check_in
    |> CheckIn.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a check_in.

  ## Examples

      iex> delete_check_in(check_in)
      {:ok, %CheckIn{}}

      iex> delete_check_in(check_in)
      {:error, %Ecto.Changeset{}}

  """
  def delete_check_in(%CheckIn{} = check_in) do
    Repo.delete(check_in)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking check_in changes.

  ## Examples

      iex> change_check_in(check_in)
      %Ecto.Changeset{data: %CheckIn{}}

  """
  def change_check_in(%CheckIn{} = check_in, attrs \\ %{}) do
    CheckIn.changeset(check_in, attrs)
  end
end
