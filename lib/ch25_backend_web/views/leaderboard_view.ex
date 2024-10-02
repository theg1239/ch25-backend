defmodule Ch25BackendWeb.LeaderboardView do
  use Ch25BackendWeb, :json

  def render("new_leaderboard.json", %{leaderboard: leaderboard}) do
    %{data: leaderboard}
  end
end
