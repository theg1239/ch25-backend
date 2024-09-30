# lib/ch25_backend/auth/firebase.ex
defmodule Ch25Backend.Auth.Firebase do
  @moduledoc """
  Firebase Authentication handler.
  """

  @firebase_project_id "cryptichunt25"

  @spec verify_token(String.t()) :: {:ok, map()} | {:error, term()}
  def verify_token(token) do
    with {:ok, %{fields: claims}} <- JOSE.JWT.peek_payload(token),
         {:ok, claims} <- validate_claims(claims) do
      {:ok, claims}
    else
      _ -> {:error, :invalid_token}
    end
  end

  defp validate_claims(%{"aud" => aud, "email" => email}) do
    if aud == @firebase_project_id and email do
      {:ok, %{"email" => email}}
    else
      {:error, :invalid_claims}
    end
  end
end
