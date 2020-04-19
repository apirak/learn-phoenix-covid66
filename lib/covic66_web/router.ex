defmodule Covic66Web.Router do
  use Covic66Web, :router

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

  scope "/", Covic66Web do
    pipe_through :browser

    get "/", PageController, :index
    get "/viruses", VirusController, :index
    get "/viruses/new", VirusController, :new
    get "/viruses/:code", VirusController, :show
    get "/viruses/:code/edit", VirusController, :edit
    put "/viruses/:code", VirusController, :update
    post "/viruses", VirusController, :create
    delete "/viruses/:code/delete", VirusController, :delete 
  end

  # Other scopes may use custom stacks.
  # scope "/api", Covic66Web do
  #   pipe_through :api
  # end
end
