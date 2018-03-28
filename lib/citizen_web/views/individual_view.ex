defmodule CitizenWeb.IndividualView do
	use CitizenWeb, :view

	def render("index.json", %{individuals: individuals}) do
		%{data: render_many(individuals, CitizenWeb.IndividualView, "individual.json")}
	end

	def render("show.json", %{individual: individual}) do
		%{data: render_one(individual, CitizenWeb.IndividualView, "individual.json")}
	end

	def render("individual.json", %{individual: individual}) do
		%{	id: individual.id,
			name: individual.name
		}
	end
end