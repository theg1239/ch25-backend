defmodule Ch25BackendWeb.LeaderboardChannel do
  use Ch25BackendWeb, :channel

  alias Ch25Backend.Questions

  def join("leaderboard:lobby", _payload, socket) do
    {:ok, socket}
  end

  # Function to broadcast new leaderboard data
  def broadcast_leaderboard do
    leaderboard = Questions.get_leaderboard()
    Ch25BackendWeb.Endpoint.broadcast("leaderboard:lobby", "new_leaderboard", leaderboard)
  end
end
