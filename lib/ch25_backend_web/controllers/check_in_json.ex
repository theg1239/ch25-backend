defmodule Ch25BackendWeb.CheckInJSON do
  alias Ch25Backend.CheckIns.CheckIn

  @doc """
  Renders a list of check_ins.
  """
  def index(%{check_ins: check_ins}) do
    %{data: for(check_in <- check_ins, do: data(check_in))}
  end

  @doc """
  Renders a single check_in.
  """
  def show(%{check_in: check_in}) do
    %{data: data(check_in)}
  end

  defp data(%CheckIn{} = check_in) do
    %{
      id: check_in.id,
      checked_in_at: check_in.checked_in_at
    }
  end
end
