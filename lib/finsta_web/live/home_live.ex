defmodule FinstaWeb.HomeLive do
  use FinstaWeb, :live_view
  alias Finsta.Posts.Post
  
  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="test-2x1">Finsta</h1>
    <.simple_form for={@form} phx-change="validate" phx-submit="save-post">
      <.live_file_input upload={@uploads.image} required />
      <.input field={@form[:caption]} type="textarea" label="Caption" required />
      <.button type="submit" phx-disable-with="Saving...">Create Post</.button>
    </.simple_form>
    """
  end
  
  @impl true
  def mount(_params, _session, socket) do
    form =
      %Post{}
      |> Post.changeset(%{})
      |> to_form(as: "post")
      
    socket = 
      socket
      |> assign(form: form)
      |> allow_upload(:image, accept: ~w(.png .jpg), max_entries: 1)
    
    {:ok, socket}
  end
  
  @impl true
  def handle_event("validate", _unsigned_params, socket) do
    {:noreply, socket}
  end
  
  @impl true
  def handle_event("save-post", _unsigned_params, socket) do
    {:noreply, socket}
  end
end