defmodule PhoenixPayroll.Shifts.TaskType do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixPayroll.Shifts.Task
  alias PhoenixPayroll.Payroll.WageType

  schema "task_types" do
    field :task_type, :string
    has_many :tasks, Task
    many_to_many :wage_types, WageType, join_through: "task_types_wage_types"

    timestamps()
  end

  @doc false
  def changeset(task_type, attrs) do
    task_type
    |> cast(attrs, [:task_type])
    |> validate_required([:task_type])
  end
end
