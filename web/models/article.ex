defmodule Clog.Article do
  use Ecto.Model

  schema "articles" do
    field :title, :string, null: false, default: "Untitled"
    field :content, :string
    field :views, :integer, null: false, default: 0
    field :enable, :boolean, default: true, null: false
    field :category_id, :integer
    field :inserted_at, :datetime
    field :updated_at, :datetime
  end
end
