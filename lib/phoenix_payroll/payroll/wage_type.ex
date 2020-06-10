defmodule PhoenixPayroll.Payroll.WageType do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixPayroll.Repo

  alias PhoenixPayroll.Shifts.TaskType

  schema "wage_types" do
    field :wage_type, :string
    many_to_many :task_types, TaskType, join_through: "task_types_wage_types"

    timestamps()
  end

  @doc false
  def changeset(wage_type, attrs) do
    wage_type
    |> cast(attrs, [:wage_type])
    |> validate_required([:wage_type])
  end

  def add_task_type_changeset(wage_type, task_type) do
    wage_type_with_task_types = wage_type |> Repo.preload(:task_types)

    change(wage_type_with_task_types)
    |> put_assoc(:task_types, wage_type_with_task_types.task_types ++ [task_type])
  end
end
