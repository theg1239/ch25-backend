defmodule Ch25BackendWeb.TeamView do
  use Ch25BackendWeb, :json

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, Ch25BackendWeb.TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, Ch25BackendWeb.TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{
      id: team.id,
      name: team.name,
      join_code: team.join_code,
      leader_id: team.leader_id
    }
  end

end
