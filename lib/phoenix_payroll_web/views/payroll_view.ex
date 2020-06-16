defmodule PhoenixPayrollWeb.PayrollView do
  use PhoenixPayrollWeb, :view
  alias PhoenixPayrollWeb.PayrollView

  def render("index.json", %{records: records}) do
    render_many(records, PayrollView, "record.json")
  end

  def render("record.json", %{record: record}) do
    %{
      wage_type_id: record.wage_type_id,
      employee_id: record.employee_id,
      date: record.date,
      hours: record.hours
    }
  end
end
