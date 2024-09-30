defmodule Ch25BackendWeb.UserSocketTest do
  use Ch25BackendWeb.ChannelCase

  alias Ch25BackendWeb.UserSocket

  test "connects successfully with valid token" do
    token = "valid_firebase_token"

    # Mock the Firebase.verify_token/1 function to return {:ok, claims}
    Ch25Backend.Auth.Firebase
    |> expect(:verify_token, fn ^token -> {:ok, %{"email" => "user@example.com"}} end)

    {:ok, socket} = connect(UserSocket, %{"token" => token})
    assert socket.assigns.user_email == "user@example.com"
  end

  test "fails to connect with invalid token" do
    token = "invalid_token"

    # Mock the Firebase.verify_token/1 function to return {:error, :invalid_token}
    Ch25Backend.Auth.Firebase
    |> expect(:verify_token, fn ^token -> {:error, :invalid_token} end)

    assert :error = connect(UserSocket, %{"token" => token})
  end
end
