defmodule PhoenixPayroll.Shifts.Shift do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias PhoenixPayroll.Shifts.Shift
  alias PhoenixPayroll.Employees.Employee
  alias PhoenixPayroll.Shifts.Task

  schema "shifts" do
    field :date, :date
    belongs_to :employee, Employee
    has_many :tasks, Task

    timestamps()
  end

  @doc false
  def changeset(shift, attrs) do
    shift
    |> cast(attrs, [:date, :employee_id])
    |> validate_required([:date, :employee_id])
  end

  def between_time_range(query \\ Shift, start_date, end_date) do
    query
    |> where([s], s.date >= ^start_date and s.date <= ^end_date)
  end
end
