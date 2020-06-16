defmodule PhoenixPayrollWeb.PayrollController do
  use PhoenixPayrollWeb, :controller

  alias PhoenixPayroll.Payroll.Calculation

  def index(conn, %{"start_date" => start_date, "end_date" => end_date}) do
    records = Calculation.calculate(start_date, end_date)
    render(conn, "index.json", records: records)
  end
end
