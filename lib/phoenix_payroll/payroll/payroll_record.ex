defmodule PhoenixPayroll.Payroll.PayrollRecord do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias PhoenixPayroll.Repo
  alias PhoenixPayroll.Payroll.PayrollRecord

  @primary_key false
  schema "payroll_records" do
    field :wage_type_id, :integer
    field :employee_id, :integer
    field :date, :date
    field :hours, :float
  end

  @doc false
  def changeset(payroll_record, attrs) do
    payroll_record
    |> cast(attrs, [:wage_type_id, :employee_id, :date, :hours])
    |> validate_required([:wage_type_id, :employee_id, :date, :hours])
  end

  def aggregate_hours(query \\ PayrollRecord) do
    query
    |> group_by([p], [p.wage_type_id, p.employee_id, p.date])
    |> select([p], %{
      wage_type_id: p.wage_type_id,
      employee_id: p.employee_id,
      date: p.date,
      hours: sum(p.hours)
    })
  end

  def create_temporary_table do
    Repo.query!(
      "CREATE TEMP TABLE payroll_records(wage_type_id INT, employee_id INT, date DATE, hours FLOAT);"
    )
  end

  def drop_temporary_table do
    Repo.query!("DROP TABLE IF EXISTS payroll_records;")
  end
end
