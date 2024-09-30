defmodule Ch25BackendWeb.UserViewTest do
  use Ch25BackendWeb.ConnCase, async: true
  alias Ch25BackendWeb.UserView

  test "renders user.json" do
    user = %{
      id: 1,
      email: "user@example.com",
      name: "Alice",
      role: "participant"
    }

    expected = %{
      id: 1,
      email: "user@example.com",
      name: "Alice",
      role: "participant"
    }

    assert UserView.render("user.json", %{user: user}) == expected
  end
end
