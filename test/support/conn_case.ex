defmodule Ch25BackendWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use Ch25BackendWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # The default endpoint for testing
      @endpoint Ch25BackendWeb.Endpoint

      use Ch25BackendWeb, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import Ch25BackendWeb.ConnCase

      alias Ch25BackendWeb.Router.Helpers, as: Routes
    end
  end

  setup tags do
    # Remove the undefined function call
    # Ch25Backend.DataCase.setup_sandbox(tags)

    # Instead, use DataCase's setup by ensuring it's invoked
    # Since DataCase is defined as a CaseTemplate, and 'ConnCase' is another CaseTemplate,
    # you need to include the setup from DataCase.

    # One way is to use 'use Ch25Backend.DataCase' within 'ConnCase'

    # However, since 'ConnCase' is already a CaseTemplate, you can import the setup logic
    # Alternatively, manually perform the sandbox setup here as per 'DataCase'

    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Ch25Backend.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Ch25Backend.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
