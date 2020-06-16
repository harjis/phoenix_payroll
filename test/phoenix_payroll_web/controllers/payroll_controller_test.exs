defmodule PhoenixPayrollWeb.PayrollControllerTest do
  use PhoenixPayrollWeb.ConnCase

  test "GET /payroll", %{conn: conn} do
    start_date = "2000-01-01"
    end_date = "2000-01-01"

    conn =
      get(conn, Routes.payroll_path(conn, :index), %{start_date: start_date, end_date: end_date})

    assert json_response(conn, 200) == []
  end
end
