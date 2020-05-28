defmodule PhoenixPayroll.Payroll.Shift do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shifts" do
    field :date, :date
    belongs_to :employee
    has_many :tasks

    timestamps()
  end

  @doc false
  def changeset(shift, attrs) do
    shift
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
