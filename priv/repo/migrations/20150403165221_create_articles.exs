defmodule Clog.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string, null: false, default: "Untitled"
      add :content, :text
      add :views, :integer, null: false, default: 0
      add :enable, :boolean, default: true, null: false
      add :category_id, :integer

      timestamps
    end

    create index(:articles, [:title])
  end
end
