defmodule Clog.Services.Config do
  import Ecto.Query

  alias Clog.Services.Toolkit
  alias Clog.Repo

  def key(key) do
    config = Repo.one(from config in Clog.Config, where: config.key == ^key)
    case config do
      nil ->
        ""
      _ ->
        config.value
    end
  end

  def secret_key() do
    key("secret_key")
  end

  def login(username, password) do
    md5_pwd = Toolkit.md5("#{password}#{secret_key}")
    if "#{username}#{md5_pwd}" == "#{key("username")}#{key("password")}",
      do: true, else: false
  end
end
