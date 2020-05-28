defmodule PhoenixPayroll.Repo.Migrations.CreateTaskTypes do
  use Ecto.Migration

  def change do
    create table(:task_types) do
      add :task_type, :string

      timestamps()
    end

  end
end
