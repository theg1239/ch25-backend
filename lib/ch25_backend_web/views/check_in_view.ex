defmodule Ch25BackendWeb.CheckInView do
  use Ch25BackendWeb, :view

  def render("index.json", %{check_ins: check_ins}) do
    %{data: render_many(check_ins, Ch25BackendWeb.CheckInView, "check_in.json")}
  end

  def render("show.json", %{check_in: check_in}) do
    %{data: render_one(check_in, Ch25BackendWeb.CheckInView, "check_in.json")}
  end

  def render("check_in.json", %{check_in: check_in}) do
    %{
      id: check_in.id,
      user_id: check_in.user_id,
      checked_in_at: check_in.checked_in_at
    }
  end
end
