defmodule Ch25BackendWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "leaderboard:lobby", Ch25BackendWeb.LeaderboardChannel

  # Transport configuration
  transport :websocket, Phoenix.Transports.WebSocket

  # Connect function to authenticate the socket connection
  def connect(%{"token" => token}, socket, _connect_info) do
    case Ch25Backend.Auth.Firebase.verify_token(token) do
      {:ok, claims} ->
        {:ok, assign(socket, :user_email, claims["email"])}
      {:error, _reason} ->
        :error
    end
  end

  def connect(_params, _socket, _connect_info), do: :error

  # Socket ID
  def id(_socket), do: nil
end
