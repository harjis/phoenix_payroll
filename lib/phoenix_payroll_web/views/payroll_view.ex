defmodule PhoenixPayrollWeb.PayrollView do
  use PhoenixPayrollWeb, :view
  alias PhoenixPayrollWeb.PayrollView

  def render("index.json", %{payrolls: payrolls}) do
    render_many(payrolls, PayrollView, "payroll.json")
  end

  def render("payroll.json", %{payroll: payroll}) do
    %{
      wage_type_id: payroll.wage_type_id,
      employee_id: payroll.employee_id,
      date: payroll.date,
      hours: payroll.hours
    }
  end
end
