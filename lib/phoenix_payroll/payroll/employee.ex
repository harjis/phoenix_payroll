defmodule PhoenixPayroll.Payroll.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :name, :string
    has_many :shifts

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
