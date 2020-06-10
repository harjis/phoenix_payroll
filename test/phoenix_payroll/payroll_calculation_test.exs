defmodule PhoenixPayroll.Payroll.CalculationTest do
  use PhoenixPayroll.DataCase
  import PhoenixPayroll.FixtureHelper

  alias PhoenixPayroll.Payroll.Calculation
  alias PhoenixPayroll.Payroll

  describe "#calculate/2" do
    test "it calculates employees working hours between time range" do
      create_test_data()
      records = Calculation.calculate(~D[2000-01-01], ~D[2000-01-01])
      assert length(records) == 3
    end
  end

  defp create_test_data do
    employee = employee_fixture()

    programming_task_type = task_type_fixture(task_type: "programming")
    pair_programming_task_type = task_type_fixture(task_type: "pair_programming")
    break_task_type = task_type_fixture(task_type: "break")
    code_review_task_type = task_type_fixture(task_type: "code_review")

    expensive_wage_type = wage_type_fixture(%{wage_type: "expensive_work"})
    cheap_wage_type = wage_type_fixture(%{wage_type: "cheap_work"})
    free_wage_type = wage_type_fixture(%{wage_type: "free_work"})

    shift = shift_fixture(%{employee_id: employee.id, date: ~D[2000-01-01]})

    Payroll.add_task_type(expensive_wage_type, programming_task_type)
    Payroll.add_task_type(expensive_wage_type, pair_programming_task_type)
    Payroll.add_task_type(cheap_wage_type, code_review_task_type)
    Payroll.add_task_type(free_wage_type, break_task_type)

    _task =
      task_fixture(%{
        shift_id: shift.id,
        task_type_id: programming_task_type.id,
        start_time: ~N[2000-01-01 08:00:00],
        end_time: ~N[2000-01-01 10:00:00]
      })

    _task2 =
      task_fixture(%{
        shift_id: shift.id,
        task_type_id: code_review_task_type.id,
        start_time: ~N[2000-01-01 10:00:00],
        end_time: ~N[2000-01-01 12:00:00]
      })

    _task3 =
      task_fixture(%{
        shift_id: shift.id,
        task_type_id: break_task_type.id,
        start_time: ~N[2000-01-01 12:00:00],
        end_time: ~N[2000-01-01 12:30:00]
      })

    _task4 =
      task_fixture(%{
        shift_id: shift.id,
        task_type_id: pair_programming_task_type.id,
        start_time: ~N[2000-01-01 12:30:00],
        end_time: ~N[2000-01-01 16:30:00]
      })
  end
end
