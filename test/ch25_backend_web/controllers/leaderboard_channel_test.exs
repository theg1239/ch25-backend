defmodule Ch25BackendWeb.LeaderboardChannelTest do
  use Ch25BackendWeb.ChannelCase

  alias Ch25BackendWeb.LeaderboardChannel

  setup do
    {:ok, _, socket} =
      Ch25BackendWeb.UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(LeaderboardChannel, "leaderboard:lobby")

    %{socket: socket}
  end

  test "broadcasts new_leaderboard on update_leaderboard", %{socket: socket} do
    leaderboard = [%{id: 1, name: "Alice", points: 100}]
    push(socket, "update_leaderboard", %{"data" => leaderboard})
    assert_broadcast "new_leaderboard", ^leaderboard
  end
end
