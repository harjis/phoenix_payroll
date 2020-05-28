defmodule PhoenixPayroll.Payroll.Shift do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shifts" do
    field :date, :date
    field :employee_id, :id

    timestamps()
  end

  @doc false
  def changeset(shift, attrs) do
    shift
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
