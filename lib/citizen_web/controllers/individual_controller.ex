defmodule CitizenWeb.IndividualController do
  use CitizenWeb, :controller
  alias Citizen.Repo
  alias Citizen.Individual

  def index(conn, _params) do
    json conn, Repo.all(Individual)
  end
end
