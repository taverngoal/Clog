defmodule Clog.Category do
  use Ecto.Model

  schema "categories" do
    field :title, :string, unique: true
    field :inserted_at, Ecto.DateTime, default: Ecto.DateTime.local
    field :updated_at, Ecto.DateTime, default: Ecto.DateTime.local
  end

end
