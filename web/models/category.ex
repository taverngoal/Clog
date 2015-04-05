defmodule Clog.Category do
  use Ecto.Model

  schema "categories" do
    field :title, :string, unique: true
    field :inserted_at, :datetime
    field :updated_at, :datetime
  end

end
