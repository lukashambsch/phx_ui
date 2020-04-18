defmodule PhxUi.Live.Table do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="flex flex-col">
      <div class="-my-2 py-2 overflow-x-auto sm:-mx-6 sm:px-6 lg:-mx-8 lg:px-8">
        <div class="align-middle inline-block min-w-full shadow overflow-hidden sm:rounded-lg border-b border-gray-200">
          <table class="min-w-full">
            <thead>
              <tr>
                <%= for column <- @columns do %>
                  <th class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                    <%= column.title %>
                  </th>
                <% end %>
              </tr>
            </thead>
            <tbody class="bg-white">
              <%= for item <- @data do %>
                <tr>
                  <%= for column <- @columns do %>
                    <td class="px-6 py-4 whitespace-no-wrap border-b border-gray-200"><%= column.content.(item) %></td>
                  <% end %>
                </tr>
              <% end %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    """
  end
end
