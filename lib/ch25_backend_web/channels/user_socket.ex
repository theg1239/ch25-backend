defmodule Ch25BackendWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  # channel "room:*", Ch25BackendWeb.RoomChannel

  def connect(%{"token" => token}, socket, _connect_info) do
    case Ch25Backend.Auth.Firebase.verify_token(token) do
      {:ok, claims} ->
        {:ok, assign(socket, :claims, claims)}

      {:error, :invalid_token} ->
        :error

      _ ->
        :error
    end
  end

  def id(_socket), do: nil
end
