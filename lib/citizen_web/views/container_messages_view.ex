defmodule CitizenWeb.ContainerMessagesView do
  use CitizenWeb, :view
  require Logger

  def render("index.json", %{container_messages: container_messages}) do
    %{
      data:
        render_many(
          container_messages,
          CitizenWeb.ContainerMessagesView,
          "container_message.json",
          as: :container_message
        )
    }
  end

  def render("show.json", %{container_message: container_message}) do
    %{
      data:
        render_one(
          container_message,
          CitizenWeb.ContainerMessagesView,
          "container_message.json",
          as: :container_message
        )
    }
  end

  def render("container_message.json", %{container_message: container_message}) do
    Logger.debug("Var value VIEW SIDE: #{inspect(container_message)}")
    %{
      id: container_message.id,
      parent_id: container_message.parent_id,
      child_id: container_message.child_id,
      inserted_at: container_message.inserted_at,
      updated_at: container_message.updated_at
    }
  end
end
