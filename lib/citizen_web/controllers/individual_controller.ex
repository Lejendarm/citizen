defmodule CitizenWeb.IndividualController do
  use CitizenWeb, :controller
  alias Citizen.Repo
  alias Citizen.Individual

  require Logger

  def index(conn, params) do


    Logger.info  "Logging this text!"
    Logger.debug "Var value: #{inspect(params)}"
    

    individuals = Repo.all(Individual)
    render(conn, "index.json", individuals: individuals)
  end

  def show(conn, %{"id" => id}) do

    Logger.info  "Logging this text!"
    Logger.debug "Var value: #{inspect(id)}"
    

    individual = Repo.get!(Individual, id);
  	render(conn, "show.json", individual: individual)
  end

  def create(conn, %{"individual" => params}) do 
  	
    changeset = Individual.changeset(%Individual{}, params)

  	case Repo.insert(changeset) do
      {:ok, individual} ->
        conn
    		|> put_status(201)
        |> render("show.json", individual: individual)
      {:error, errors} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", errors: errors)
  	end
  end

  def update(conn, %{"id"=> id, "individual" => params}) do

    individual = Repo.get!(Individual, id);
    changeset = Individual.changeset(individual, params);

    case Repo.update(changeset) do 
      {:ok, individual} ->
        render(conn, "show.json", individual: individual)
      {:error, errors} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ErrorView, "422.json", errors: errors)
    end
  end

  def delete(conn, %{"id" => id}) do
    individual = Repo.get!(Individual, id);

    case Repo.delete(individual) do
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