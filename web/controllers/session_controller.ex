defmodule Clog.SessionController do
  use Clog.Web, :controller

  alias Clog.Services.Config

  plug :action


  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"username" => username, "password" => password}) do
    if Config.login(conn, username, password) do
      conn = put_session(conn, :user, true)
      redirect(conn, to: Clog.Router.Helpers.article_path(Endpoint, :index))
    else
      redirect(conn, to: Clog.Router.Helpers.session_path(Endpoint, :new))
    end
  end

  def delete(conn,_params) do
  end

end
