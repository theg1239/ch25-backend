defmodule Ch25BackendWeb.FallbackController do
  use Ch25BackendWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(Ch25BackendWeb.ChangesetJSON)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(Ch25BackendWeb.ErrorJSON)
    |> render("404.json")
  end
end
