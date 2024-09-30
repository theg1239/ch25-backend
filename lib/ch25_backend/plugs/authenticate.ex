defmodule Ch25BackendWeb.Plugs.Authenticate do
  import Plug.Conn
  alias Ch25Backend.Auth.Firebase

  def init(default), do: default

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Firebase.verify_token(token) do
      assign(conn, :current_user, claims)
    else
      _ ->
        conn
        |> send_resp(401, "Unauthorized")
        |> halt()
    end
  end
end
    