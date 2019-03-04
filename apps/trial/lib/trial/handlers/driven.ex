defmodule Trial.Handlers.Driven do
  @moduledoc """
  Listens for events and acts on them
  """

  use Commanded.Event.Handler, name: "drivenA"
  alias Trial.Events.UserRegistered
  require Logger

  def handle(%UserRegistered{}, _metadata) do
    Logger.info("Handling Driven event")
    :ok
  end

  def handle(event, _metadata) do
    Logger.info("Handling unhandled Driven event: #{inspect(event)}")
    :ok
  end
end
