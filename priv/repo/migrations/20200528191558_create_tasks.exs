defmodule PhoenixPayroll.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :task_type_id, references(:task_types, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:task_type_id])
  end
end
