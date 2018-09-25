defmodule CitizenWeb.MessageController do
  use CitizenWeb, :controller
  alias Citizen.Repo
  alias Citizen.Message

  require Logger

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.json", messages: messages)
  end

  def show(conn, %{"id" => id}) do
    message = Repo.get!(Message, id)
    render(conn, "show.json", message: message)
  end

  def create(conn, %{"message" => params}) do
    changeset = Message.changeset(%Message{}, params)

    case Repo.insert(changeset) do
      {:ok, message} ->
        conn
        |> put_status(201)
        |> render("show.json", message: message)

      {:error, errors} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", errors: errors)
    end
  end

  def update(conn, %{"id" => id, "message" => params}) do
    message = Repo.get!(Message, id)
    changeset = Message.changeset(message, params)

    case Repo.update(changeset) do
      {:ok, message} ->
        render(conn, "show.json", message: message)

      {:error, errors} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ErrorView, "422.json", errors: errors)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Repo.get!(Message, id)

    case Repo.delete(message) do
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
