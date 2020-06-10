defmodule PhoenixPayroll.Employees.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixPayroll.Shifts.Shift

  schema "employees" do
    field :name, :string
    has_many :shifts, Shift

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
