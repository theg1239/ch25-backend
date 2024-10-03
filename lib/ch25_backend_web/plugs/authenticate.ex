defmodule Ch25BackendWeb.Plugs.Authenticate do
  import Plug.Conn
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Ch25Backend.Auth.Firebase.verify_token(token) do
      assign(conn, :current_user, claims)
    else
      _ ->
        conn
        |> put_status(:unauthorized)
        |> put_view(Ch25BackendWeb.ErrorJSON)
        |> render("401.json")
        |> halt()
    end
  end
end
