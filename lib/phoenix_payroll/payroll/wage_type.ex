defmodule PhoenixPayroll.Payroll.WageType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wage_types" do
    field :wage_type, :string

    timestamps()
  end

  @doc false
  def changeset(wage_type, attrs) do
    wage_type
    |> cast(attrs, [:wage_type])
    |> validate_required([:wage_type])
  end
end
