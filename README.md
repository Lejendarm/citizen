# Citizen

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## Current task

	* ContainerMessages Creation, error view issue

## Todo

	

## Issues

	* All name maybe in plurial

## Done

Entities :

	* Container MVC
		Container of entities, regroup a set of Individual, of Message, of Right on itself and of other containers

	* Individual MVC
		Person or Bot

	* Message MVC
		An ID A text

	* Right MVC
 		Contains all possible rights than can be used

Relations :
	
	* Container > all M

		Allow all container relations

	* Interference M

		Allow a container to have rights on another container
