defmodule Ch25Backend.DataCase do
  @moduledoc """
  This module defines the setup for tests requiring
  access to the application's data layer.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ch25Backend.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Ch25Backend.DataCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Ch25Backend.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Ch25Backend.Repo, {:shared, self()})
    end

    :ok
  end
end
