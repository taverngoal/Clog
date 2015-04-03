defmodule Clog.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string, unique: true

      timestamps
    end
  end
end
