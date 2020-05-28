defmodule PhoenixPayroll.Repo.Migrations.CreateWageTypes do
  use Ecto.Migration

  def change do
    create table(:wage_types) do
      add :wage_type, :string

      timestamps()
    end

  end
end
