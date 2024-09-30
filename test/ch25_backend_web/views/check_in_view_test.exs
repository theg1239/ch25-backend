defmodule Ch25BackendWeb.CheckInViewTest do
  use Ch25BackendWeb.ConnCase, async: true
  alias Ch25BackendWeb.CheckInView

  test "renders check_in.json" do
    check_in = %{
      id: 1,
      user_id: 1,
      checked_in_at: ~U[2024-09-30 17:15:00Z]
    }

    expected = %{
      id: 1,
      user_id: 1,
      checked_in_at: ~U[2024-09-30 17:15:00Z]
    }

    assert CheckInView.render("check_in.json", %{check_in: check_in}) == expected
  end
end
