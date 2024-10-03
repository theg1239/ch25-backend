defmodule Ch25BackendWeb.ChangesetJSON do
  use Ch25BackendWeb, :json

  import Ch25BackendWeb.ErrorHelpers, only: [translate_error: 1]

  def render("error.json", %{changeset: changeset}) do
    %{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)}
  end
end
