defmodule Ch25BackendWeb.CoreComponents do
  use Phoenix.Component

  # Flash Group Component
  def flash_group(assigns) do
    ~H"""
    <div
      :for={{type, messages} <- Phoenix.Flash.group(@flash)}
      role="alert"
      class="fixed top-0 right-0 m-4 w-96"
    >
      <div :for={msg <- messages} class={"alert alert-#{type} shadow-lg mb-4"}>
        <div>
          <!-- Icon based on the type -->
          <%= case type do %>
            <% "info" -> %>
              <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current flex-shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M12 20a8 8 0 1 0-8-8 8 8 0 0 0 8 8z"/></svg>
            <% "error" -> %>
              <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current flex-shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m9-2a9 9 0 1 1-18 0 9 9 0 0 1 18 0z"/></svg>
            <% _ -> %>
              <!-- Default icon -->
          <% end %>
          <span><%= msg %></span>
        </div>
      </div>
    </div>
    """
  end

  # ... other components ...
end
