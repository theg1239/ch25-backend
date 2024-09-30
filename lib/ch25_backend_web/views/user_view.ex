defmodule Ch25BackendWeb.UserView do
  use Ch25BackendWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Ch25BackendWeb.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Ch25BackendWeb.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      name: user.name,
      role: user.role
    }
  end
end
