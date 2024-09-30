defmodule Ch25BackendWeb.ErrorJSONTest do
  use Ch25BackendWeb.ConnCase, async: true

  test "renders 404" do
    assert Ch25BackendWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Ch25BackendWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
