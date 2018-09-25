defmodule CitizenWeb.ContainerMessagesController do
  use CitizenWeb, :controller
  alias Citizen.Repo
  alias Citizen.Message
  alias Citizen.ContainerMessages

  require Logger

  def index(conn, %{"container_id" => container_id}) do
    container_messages = Repo.all(ContainerMessages.retrieveContainerMessages(container_id))
    Logger.debug("Var INDEX: #{inspect(container_messages)}")

    render(conn, "index.json", container_messages: container_messages)
  end

  def show(conn, %{"id" => id}) do
    {intVal, ""} = Integer.parse(id)
    container_message = Repo.get!(ContainerMessages, intVal)
    Logger.debug("Var SHOW: #{inspect(container_message)}")
    render(conn, "show.json", container_message: container_message)
  end

  def create(conn, %{"container_id" => container_id, "message" => params}) do
    # Il faut creer un message PUIS sa relation lol

    changeset = Message.changeset(%Message{}, %{individual_id: 2, content: params["content"]})

    case Repo.insert(changeset) do
      {:ok, message} ->
        {intVal, ""} = Integer.parse(container_id)

        changeset =
          ContainerMessages.changeset(%ContainerMessages{}, %{
            parent_id: intVal,
            child_id: message.id
          })

        case Repo.insert(changeset) do
          {:ok, container_messages} ->
            conn
            |> put_status(201)
            |> render("show.json", container_messages: container_messages)

          {:error, errors} ->
            conn
            |> put_status(422)
            |> render(ErrorView, "422.json", errors: errors)
        end

      {:error, errors} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", errors: errors)
    end

    # changeset = ContainerMessages.changeset(%ContainerMessages{}, params)

    # case Repo.insert(changeset) do
    #   {:ok, container_messages} ->
    #     conn
    #     |> put_status(201)
    #     |> render("show.json", container_messages: container_messages)

    #   {:error, errors} ->
    #     conn
    #     |> put_status(422)
    #     |> render(ErrorView, "422.json", errors: errors)
    # end
  end

  def update(conn, %{"id" => id, "container_messages" => params}) do
    container_messages = Repo.get!(ContainerMessages, id)
    changeset = ContainerMessages.changeset(container_messages, params)

    case Repo.update(changeset) do
      {:ok, container_messages} ->
        render(conn, "show.json", container_messages: container_messages)

      {:error, errors} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ErrorView, "422.json", errors: errors)
    end
  end

  def delete(conn, %{"id" => id}) do
    container_messages = Repo.get!(ContainerMessages, id)

    case Repo.delete(container_messages) do
      {:ok, _params} ->
        conn
        |> put_status(204)
        |> send_resp(:no_content, "")

      {:error, _params} ->
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "Not found")
    end
  end
end
