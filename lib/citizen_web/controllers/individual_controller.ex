defmodule CitizenWeb.IndividualController do
  use CitizenWeb, :controller
  alias Citizen.Repo
  alias Citizen.Individual

  def index(conn, _params) do
    individuals = Repo.all(Individual)
    render(conn, "index.json", individuals)
  end

  def show(conn, %{"id" => id}) do
  	with {:ok, individual} <- Repo.get(Individual, id) do
  		render(conn, "show.json", individual: individual)
    else
      nil ->
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "Not found")

  	end
  end

  def create(conn, params) do 
  	changeset = Individual.changeset(%Individual{}, params)

  	with {:ok, individual} <- Repo.insert(changeset) do
      conn
  		|> put_status(201)
      |> render("show.json", individual: individual)
    else
      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
  	end
  end

  def update(conn, params) do
    changeset = Individual.changeset(%Individual{}, params)

    with {:ok, individual} <- Repo.update(Individual, changeset) do
      conn
      |> put_status(201)
      |> render('show.json', individual: individual)
    else
      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end

  def delete(conn, %{"id" => id}) do
    with individual = %Individual{} <- Repo.get(Individual, id) do
      Repo.delete!(individual)
      conn
      |> put_status(204)
      |> send_resp(:no_content, "")
    else
      nil ->
        conn
        |>  put_status(404)
        |>  render(ErrorView, "404.json", error: "Not found")
    end
  end

end