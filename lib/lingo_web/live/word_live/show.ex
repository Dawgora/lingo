defmodule LingoWeb.WordLive.Show do
  use LingoWeb, :live_view

  alias Lingo.Game

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:word, Game.get_word!(id))}
  end

  defp page_title(:show), do: "Show Word"
  defp page_title(:edit), do: "Edit Word"
end
