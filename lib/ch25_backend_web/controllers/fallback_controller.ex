defmodule Ch25BackendWeb.FallbackController do
  use Ch25BackendWeb, :controller

  # This clause handles errors returned by Ecto's insert/update/delete.
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(Ch25BackendWeb.ChangesetView, "error.json", changeset: changeset)
  end

  # This clause handles resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(Ch25BackendWeb.ErrorJSON, "404.json")
  end
end
