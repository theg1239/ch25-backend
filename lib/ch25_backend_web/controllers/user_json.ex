defmodule Ch25BackendWeb.UserJSON do
  use Ch25BackendWeb, :json

  def index(%{users: users}) do
    %{data: for(user <- users, do: user_json(user))}
  end

  def show(%{user: user}) do
    %{data: user_json(user)}
  end

  defp user_json(user) do
    %{
      id: user.id,
      email: user.email,
      name: user.name,
      role: user.role,
      team_id: user.team_id
    }
  end
end
