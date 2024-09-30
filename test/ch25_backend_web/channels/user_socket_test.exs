defmodule Ch25BackendWeb.UserSocketTest do
  use Ch25BackendWeb.ChannelCase

  alias Ch25BackendWeb.UserSocket

  test "connects successfully with valid token" do
    # Replace with a valid token generation method
    token = "valid_firebase_token"

    {:ok, socket} = connect(UserSocket, %{"token" => token})
    assert socket.assigns.user_email == "user@example.com"
  end

  test "fails to connect with invalid token" do
    token = "invalid_token"

    assert :error = connect(UserSocket, %{"token" => token})
  end
end
