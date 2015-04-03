defmodule Clog.Repo.Migrations.CreateConfigs do
  use Ecto.Migration

  def change do
    create table(:configs) do
      add :key, :string
      add :value, :string

      timestamps
    end
  end
end
