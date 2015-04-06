defmodule Clog.Config do

  use Ecto.Model

  schema "configs" do
    field :key, :string, unique: true
    field :value, :string
    field :inserted_at, Ecto.DateTime, default: Ecto.DateTime.local
    field :updated_at, Ecto.DateTime, default: Ecto.DateTime.local

  end
end
