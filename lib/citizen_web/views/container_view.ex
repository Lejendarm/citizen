defmodule CitizenWeb.ContainerView do
	use CitizenWeb, :view

	def render("index.json", %{containers: containers}) do
		%{data: render_many(containers, CitizenWeb.ContainerView, "container.json")}
	end

	def render("show.json", %{container: container}) do
		%{data: render_one(container, CitizenWeb.ContainerView, "container.json")}
	end

	def render("container.json", %{container: container}) do
		%{	id: container.id,
			label: container.label
		}
	end
end