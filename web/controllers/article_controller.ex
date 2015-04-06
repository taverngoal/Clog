defmodule Clog.ArticleController do
  use Clog.Web, :controller

  alias Clog.Services.Config
  plug :action
  plug :render when action in [:index, :show]

  def index(conn, _params) do
    Config.seed_data
    conn
  end

  def show(conn, _params) do
    conn
  end

  def new(conn, _params) do
  end

  def create(conn, _params) do

  end

  def edit(conn,_params) do

  end

  def update(conn,_params) do
  end

  def delete(conn,_params) do
  end
end
