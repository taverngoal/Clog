defmodule Clog.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html", "json", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Clog do
    pipe_through :browser # Use the default browser stack

    get "/", ArticleController, :index
    resources "articles", ArticleController, except: [:index]
    resources "sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Clog do
  #   pipe_through :api
  # end
end
