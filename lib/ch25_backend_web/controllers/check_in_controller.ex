defmodule Ch25BackendWeb.CheckInController do
  use Ch25BackendWeb, :controller

  alias Ch25Backend.CheckIns
  alias Ch25Backend.CheckIns.CheckIn

  action_fallback Ch25BackendWeb.FallbackController

  def index(conn, _params) do
    check_ins = CheckIns.list_check_ins()
    render(conn, "index.json", check_ins: check_ins)
  end

  def create(conn, %{"check_in" => check_in_params}) do
    with {:ok, %CheckIn{} = check_in} <- CheckIns.create_check_in(check_in_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.check_in_path(conn, :show, check_in))
      |> render("show.json", check_in: check_in)
    end
  end

  def show(conn, %{"id" => id}) do
    check_in = CheckIns.get_check_in!(id)
    render(conn, "show.json", check_in: check_in)
  end

  def update(conn, %{"id" => id, "check_in" => check_in_params}) do
    check_in = CheckIns.get_check_in!(id)

    with {:ok, %CheckIn{} = check_in} <- CheckIns.update_check_in(check_in, check_in_params) do
      render(conn, "show.json", check_in: check_in)
    end
  end

  def delete(conn, %{"id" => id}) do
    check_in = CheckIns.get_check_in!(id)

    with {:ok, %CheckIn{}} <- CheckIns.delete_check_in(check_in) do
      send_resp(conn, :no_content, "")
    end
  end
end
  