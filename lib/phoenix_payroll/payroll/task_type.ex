defmodule PhoenixPayroll.Payroll.TaskType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "task_types" do
    field :task_type, :string
    has_many :tasks

    timestamps()
  end

  @doc false
  def changeset(task_type, attrs) do
    task_type
    |> cast(attrs, [:task_type])
    |> validate_required([:task_type])
  end
end
