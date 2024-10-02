defmodule Ch25BackendWeb.ErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  use Phoenix.HTML

  @doc """
  Translates an Ecto changeset error into a human-readable message.

  ## Examples

      iex> translate_error({"is invalid", []})
      "is invalid"

      iex> translate_error({"should be at least %{count} characters", [count: 3]})
      "should be at least 3 characters"
  """
  def translate_error({msg, opts}) do
    # If you are using gettext, uncomment the following line and ensure you have the appropriate translations
    # Gettext.dgettext(Ch25BackendWeb.Gettext, "errors", msg, opts)

    # Otherwise, you can use a simple string replacement
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end
