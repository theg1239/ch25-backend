defmodule Ch25Backend.Repo do
  use Ecto.Repo,
    otp_app: :ch25_backend,
    adapter: Ecto.Adapters.Postgres
end
