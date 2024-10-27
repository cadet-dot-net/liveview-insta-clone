defmodule FinstaWeb.HomeLive do
  use FinstaWeb, :live_view
  
  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="test-2x1">Finsta</h1>
    """
  end
  
  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end