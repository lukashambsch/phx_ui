defmodule PhxUi.TemplatesView do
  use Phoenix.HTML
  use Phoenix.View, root: "lib", namespace: PhxUi

  def is_nav_link_active(conn, to) do
    conn.request_path == to
  end
end
