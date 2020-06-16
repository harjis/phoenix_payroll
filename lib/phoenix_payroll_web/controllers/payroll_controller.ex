defmodule PhoenixPayrollWeb.PayrollController do
  use PhoenixPayrollWeb, :controller

  alias PhoenixPayroll.Payroll.Calculation

  def index(conn, %{"start_date" => start_date, "end_date" => end_date}) do
    payrolls = Calculation.calculate(start_date, end_date)
    render(conn, "index.json", payrolls: payrolls)
  end
end
