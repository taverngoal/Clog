defmodule Clog.SessionController do
  use Clog.Web, :controller

  plug :action


  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, _params) do

  end

  def delete(conn,_params) do
  end

end
