defmodule CitizenWeb.ContainerController do
  use CitizenWeb, :controller
  alias Citizen.Repo
  alias Citizen.Container

  require Logger

  def index(conn, _params) do
    containers = Repo.all(Container)
    render(conn, "index.json", containers: containers)
  end

  def show(conn, %{"id" => id}) do
    container = Repo.get!(Container, id);
  	render(conn, "show.json", container: container)
  end

  def create(conn, %{"container" => params}) do 
  	
    changeset = Container.changeset(%Container{}, params)

  	case Repo.insert(changeset) do
      {:ok, container} ->
        conn
    		|> put_status(201)
        |> render("show.json", container: container)
      {:error, errors} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", errors: errors)
  	end
  end

  def update(conn, %{"id"=> id, "container" => params}) do

    container = Repo.get!(Container, id);
    changeset = Container.changeset(container, params);

    case Repo.update(changeset) do 
      {:ok, container} ->
        render(conn, "show.json", container: container)
      {:error, errors} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ErrorView, "422.json", errors: errors)
    end
  end

  def delete(conn, %{"id" => id}) do
    container = Repo.get!(Container, id);

    case Repo.delete(container) do
      {:ok, _params} ->
        conn
        |> put_status(204)
        |> send_resp(:no_content, "")
      {:error, _params} ->
          conn
          |>  put_status(404)
          |>  render(ErrorView, "404.json", error: "Not found")
      end
  end

end