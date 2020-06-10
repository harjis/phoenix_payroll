defmodule PhoenixPayroll.Repo.Migrations.AddShiftIDToTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :shift_id, references(:shifts, on_delete: :nothing), null: false
    end
  end
end
