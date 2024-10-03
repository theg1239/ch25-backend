defmodule Ch25BackendWeb.CoreComponents do
  use Phoenix.Component

  def flash_group(assigns) do
    ~H"""
    <div class="fixed top-0 right-0 m-4 w-96">
      <%= for {type, messages} <- group_flash(@flash) do %>
        <%= for msg <- messages do %>
          <div class={"alert alert-#{type} shadow-lg mb-4"}>
            <div>
              <%= case type do %>
                <% "info" -> %>
                  <!-- Icon for info -->
                <% "error" -> %>
                  <!-- Icon for error -->
                <% _ -> %>
                  <!-- Default icon -->
              <% end %>
              <span><%= msg %></span>
            </div>
          </div>
        <% end %>
      <% end %>
    </div>
    """
  end

  defp group_flash(flash) do
    Enum.group_by(flash, fn {type, _msg} -> type end, fn {_type, msg} -> msg end)
  end
end
