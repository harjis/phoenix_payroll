defmodule PhoenixPayroll.Payroll.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    belongs_to :task_type

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:start_time, :end_time])
    |> validate_required([:start_time, :end_time])
  end
end
