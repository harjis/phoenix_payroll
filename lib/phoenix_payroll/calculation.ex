defmodule PhoenixPayroll.Payroll.Calculation do
  alias PhoenixPayroll.Repo

  alias PhoenixPayroll.Payroll
  alias PhoenixPayroll.Payroll.PayrollRecord
  alias PhoenixPayroll.Shifts.Task

  defmacrop create_and_drop_temporary_table(do: yield) do
    quote do
      create_temporary_table()
      result = unquote(yield)
      drop_temporary_table()

      result
    end
  end

  def calculate(start_date, end_date) do
    create_and_drop_temporary_table do
      tasks = get_tasks(start_date, end_date)
      create_payroll_records(tasks)
      aggregate_payroll_records()
    end
  end

  defp get_tasks(start_date, end_date) do
    Task
    |> Task.with_shift_date(start_date, end_date)
    |> Repo.all()
    |> Repo.preload([{:task_type, :wage_types}, :shift])
  end

  defp create_payroll_records(tasks) do
    tasks
    |> Enum.each(fn task ->
      [first_wage_type | _tail] = task.task_type.wage_types
      employee_id = task.shift.employee_id
      date = task.shift.date
      duration_in_hours = Timex.diff(task.end_time, task.start_time, :hours)

      Payroll.create_payroll_record(%{
        wage_type_id: first_wage_type.id,
        employee_id: employee_id,
        date: date,
        hours: duration_in_hours
      })
    end)
  end

  defp aggregate_payroll_records() do
    PayrollRecord
    |> PayrollRecord.aggregate_hours()
    |> Repo.all()
  end

  defp create_temporary_table, do: PayrollRecord.create_temporary_table()
  defp drop_temporary_table, do: PayrollRecord.drop_temporary_table()
end
