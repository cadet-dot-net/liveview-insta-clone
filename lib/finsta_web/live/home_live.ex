defmodule FinstaWeb.HomeLive do
  use FinstaWeb, :live_view
  alias Finsta.Posts.Post
  
  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="test-2x1">Finsta</h1>
    <.simple_form for={@form}>
      <.input field={@form[:caption]} type="textarea" label="Caption" required />
    </.simple_form>
    """
  end
  
  @impl true
  def mount(_params, _session, socket) do
    form =
      %Post{}
      |> Post.changeset(%{})
      |> to_form(as: "post")
      
    socket = assign(socket, form: form)
    
    {:ok, socket}
  end
end