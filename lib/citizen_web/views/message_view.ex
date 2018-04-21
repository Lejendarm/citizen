defmodule CitizenWeb.MessageView do
	use CitizenWeb, :view

	def render("index.json", %{messages: messages}) do
		%{data: render_many(messages, CitizenWeb.MessageView, "message.json")}
	end

	def render("show.json", %{message: message}) do
		%{data: render_one(message, CitizenWeb.MessageView, "message.json")}
	end

	def render("message.json", %{message: message}) do
		%{	id: message.id,
			content: message.content,
			individual_id: message.individual_id,
		}
	end
end