defmodule PhoenixPayroll.Repo.Migrations.CreateShifts do
  use Ecto.Migration

  def change do
    create table(:shifts) do
      add :date, :date
      add :employee_id, references(:employees, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:shifts, [:employee_id])
  end
end
