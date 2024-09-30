defmodule Ch25BackendWeb.ErrorHTMLTest do
  use Ch25BackendWeb.ConnCase, async: true

  test "renders 404.html" do
    assert render_to_string(Ch25BackendWeb.ErrorHTML, "404.html", []) =~ "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(Ch25BackendWeb.ErrorHTML, "500.html", []) =~ "Internal Server Error"
  end
end
