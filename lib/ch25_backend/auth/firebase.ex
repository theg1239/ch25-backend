defmodule Ch25Backend.Auth.Firebase do
  alias JOSE.JWT

  def verify_token(token) do
    pem = pem()

    if pem == nil do
      {:error, :invalid_pem}
    else
      case JOSE.JWT.verify_strict(JOSE.JWK.from_pem(pem), ["RS256"], token) do
        {true, %JWT{fields: claims}, _jws} ->
          {:ok, claims}

        {false, _jwt, _jws} ->
          {:error, :invalid_token}
      end
    end
  end

  defp pem do
    System.get_env("FIREBASE_PEM")
  end
end
