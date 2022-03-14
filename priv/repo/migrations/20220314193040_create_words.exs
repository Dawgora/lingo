defmodule Lingo.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :name, :string
      add :is_used?, :boolean, default: false, null: false

      timestamps()
    end
  end
end
