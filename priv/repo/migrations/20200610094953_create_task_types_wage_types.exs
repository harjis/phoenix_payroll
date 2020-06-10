defmodule PhoenixPayroll.Repo.Migrations.CreateTaskTypesWageTypes do
  use Ecto.Migration

  def change do
    create table(:task_types_wage_types) do
      add :task_type_id, references(:task_types), null: false
      add :wage_type_id, references(:wage_types), null: false
    end

    create unique_index(:task_types_wage_types, [:task_type_id, :wage_type_id])
  end
end
