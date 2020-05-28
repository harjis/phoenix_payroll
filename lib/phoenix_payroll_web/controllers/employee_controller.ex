defmodule PhoenixPayrollWeb.EmployeeController do
  use PhoenixPayrollWeb, :controller

  alias PhoenixPayroll.Payroll
  alias PhoenixPayroll.Payroll.Employee

  action_fallback PhoenixPayrollWeb.FallbackController

  def index(conn, _params) do
    employees = Payroll.list_employees()
    render(conn, "index.json", employees: employees)
  end

  def create(conn, %{"employee" => employee_params}) do
    with {:ok, %Employee{} = employee} <- Payroll.create_employee(employee_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.employee_path(conn, :show, employee))
      |> render("show.json", employee: employee)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = Payroll.get_employee!(id)
    render(conn, "show.json", employee: employee)
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = Payroll.get_employee!(id)

    with {:ok, %Employee{} = employee} <- Payroll.update_employee(employee, employee_params) do
      render(conn, "show.json", employee: employee)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = Payroll.get_employee!(id)

    with {:ok, %Employee{}} <- Payroll.delete_employee(employee) do
      send_resp(conn, :no_content, "")
    end
  end
end
