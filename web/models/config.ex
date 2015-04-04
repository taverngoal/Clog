defmodule Clog.Config do

  use Ecto.Model

  schema "configs" do
    field :key, :string, unique: true
    field :value, :string
    field :created_at, :datetime
    field :updated_at, :datetime

  end
end
