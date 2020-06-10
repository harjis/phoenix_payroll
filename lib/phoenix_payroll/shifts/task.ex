defmodule PhoenixPayroll.Shifts.Task do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias PhoenixPayroll.Shifts.Shift
  alias PhoenixPayroll.Shifts.TaskType
  alias PhoenixPayroll.Shifts.Task

  schema "tasks" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    belongs_to :shift, Shift
    belongs_to :task_type, TaskType

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:start_time, :end_time, :shift_id, :task_type_id])
    |> validate_required([:start_time, :end_time, :shift_id, :task_type_id])
  end

  def with_shift_date(query \\ Task, start_date, end_date) do
    query
    |> join_shift
    |> where([shift: s], s.date >= ^start_date and s.date <= ^end_date)
  end

  defp join_shift(query \\ Task) do
    if has_named_binding?(query, :shift) do
      query
    else
      query
      |> join(:inner, [t], s in assoc(t, :shift), as: :shift)
    end
  end
end
