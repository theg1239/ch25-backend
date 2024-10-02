defmodule Ch25BackendWeb.Layouts do
  use Ch25BackendWeb, :html

  import Phoenix.Controller, only: [get_csrf_token: 0]

  embed_templates "layouts/*"
end
