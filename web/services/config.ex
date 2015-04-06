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

  def secret_key do
    key("secret_key")
  end

  def initialized do
    key("initialized")
  end

  def login(conn, username, password) do
    md5_pwd = Toolkit.md5("#{password}#{secret_key}")
    if "#{username}#{md5_pwd}" == "#{key("username")}#{key("password")}" do
      true
    else
      false
    end
  end

  def seed_data do
    if initialized != "true" do
      _secret_key = "1234567890"
      Repo.transaction(fn ->
        Repo.insert(%Clog.Config{key: "secret_key", value: _secret_key})
        Repo.insert(%Clog.Config{key: "username", value: "tavern"})
        Repo.insert(%Clog.Config{key: "password", value: Toolkit.md5("901001#{_secret_key}")})
        Repo.insert(%Clog.Config{key: "initialized", value: "true"})
      end)
    end
  end
end
