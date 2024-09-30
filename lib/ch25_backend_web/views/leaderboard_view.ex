defmodule Ch25BackendWeb.LeaderboardView do
  use Ch25BackendWeb, :view

  def render("new_leaderboard.json", %{leaderboard: leaderboard}) do
    %{data: leaderboard}
  end
end
