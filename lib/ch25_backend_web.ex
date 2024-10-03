defmodule Ch25BackendWeb do
  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        namespace: Ch25BackendWeb

      import Plug.Conn
      import Ch25BackendWeb.Gettext
      alias Ch25BackendWeb.Router.Helpers, as: Routes
    end
  end

  def html do
    quote do
      use Phoenix.Component

      use Phoenix.VerifiedRoutes,
        endpoint: Ch25BackendWeb.Endpoint,
        router: Ch25BackendWeb.Router

      unquote(html_helpers())
    end
  end

  def json do
    quote do
      import Phoenix.View, only: [render: 3, render_to_iodata: 3]

      unquote(json_helpers())
    end
  end

  defp html_helpers do
    quote do
      use Phoenix.HTML

      import Phoenix.LiveView.Helpers
      import Phoenix.Component

      import Ch25BackendWeb.CoreComponents

      import Phoenix.Controller, only: [get_csrf_token: 0]

      import Ch25BackendWeb.ErrorHelpers
      import Ch25BackendWeb.Gettext
      alias Ch25BackendWeb.Router.Helpers, as: Routes
    end
  end


  defp json_helpers do
    quote do
      import Phoenix.View

      import Ch25BackendWeb.ErrorHelpers
      import Ch25BackendWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Ch25BackendWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/component/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
