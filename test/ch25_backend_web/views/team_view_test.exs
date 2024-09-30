defmodule Ch25BackendWeb.TeamViewTest do
  use Ch25BackendWeb.ConnCase, async: true
  alias Ch25BackendWeb.TeamView

  test "renders team.json" do
    team = %{id: 1, name: "Team Alpha", join_code: "ABCDE", leader_id: 1}
    expected = %{
      id: 1,
      name: "Team Alpha",
      join_code: "ABCDE",
      leader_id: 1
    }

    assert TeamView.render("team.json", %{team: team}) == expected
  end
end
