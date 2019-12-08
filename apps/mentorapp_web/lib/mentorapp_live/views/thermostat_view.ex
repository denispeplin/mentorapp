defmodule MentorappLive.ThermostatLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    Current temperature: <%= @temperature %>
    <button phx-click="inc_temperature">+</button>
    <button phx-click="dec_temperature">-</button>
    """
  end

  def mount(_, socket) do
    {:ok, assign(socket, :temperature, 1)}
  end

  def handle_event("inc_temperature", _value, socket) do
    {:noreply, assign(socket, :temperature, socket.assigns.temperature + 1)}
  end

  def handle_event("dec_temperature", _value, socket) do
    {:noreply, assign(socket, :temperature, socket.assigns.temperature - 1)}
  end
end
