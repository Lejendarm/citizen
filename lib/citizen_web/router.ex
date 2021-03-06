defmodule CitizenWeb.Router do
  use CitizenWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CitizenWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", CitizenWeb do
    pipe_through :api

    resources "/individuals", IndividualController
    resources "/containers", ContainerController
    resources "/messages", MessageController

    resources "/containers/:container_id/messages", ContainerMessagesController

  end
end
