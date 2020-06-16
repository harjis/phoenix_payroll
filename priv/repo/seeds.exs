# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixPayroll.Repo.insert!(%PhoenixPayroll.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

PhoenixPayroll.Repo.transaction(
  fn ->
    programming_task_type =
      PhoenixPayroll.FixtureHelper.task_type_fixture(task_type: "programming")

    pair_programming_task_type =
      PhoenixPayroll.FixtureHelper.task_type_fixture(task_type: "pair_programming")

    break_task_type = PhoenixPayroll.FixtureHelper.task_type_fixture(task_type: "break")

    code_review_task_type =
      PhoenixPayroll.FixtureHelper.task_type_fixture(task_type: "code_review")

    expensive_wage_type =
      PhoenixPayroll.FixtureHelper.wage_type_fixture(%{wage_type: "expensive_work"})

    cheap_wage_type = PhoenixPayroll.FixtureHelper.wage_type_fixture(%{wage_type: "cheap_work"})
    free_wage_type = PhoenixPayroll.FixtureHelper.wage_type_fixture(%{wage_type: "free_work"})

    PhoenixPayroll.Payroll.add_task_type(expensive_wage_type, programming_task_type)
    PhoenixPayroll.Payroll.add_task_type(expensive_wage_type, pair_programming_task_type)
    PhoenixPayroll.Payroll.add_task_type(cheap_wage_type, code_review_task_type)
    PhoenixPayroll.Payroll.add_task_type(free_wage_type, break_task_type)

    date_range = Date.range(~D[2000-01-01], ~D[2000-12-31])
    range = 1..10

    Enum.each(range, fn i ->
      employee = PhoenixPayroll.FixtureHelper.employee_fixture(%{name: "Employee #{i}"})

      Enum.each(date_range, fn date ->
        shift =
          PhoenixPayroll.FixtureHelper.shift_fixture(%{employee_id: employee.id, date: date})

        _task =
          PhoenixPayroll.FixtureHelper.task_fixture(%{
            shift_id: shift.id,
            task_type_id: programming_task_type.id,
            start_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 08:00:00"),
            end_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 10:00:00")
          })

        _task2 =
          PhoenixPayroll.FixtureHelper.task_fixture(%{
            shift_id: shift.id,
            task_type_id: code_review_task_type.id,
            start_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 10:00:00"),
            end_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 12:00:00")
          })

        _task3 =
          PhoenixPayroll.FixtureHelper.task_fixture(%{
            shift_id: shift.id,
            task_type_id: break_task_type.id,
            start_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 12:00:00"),
            end_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 12:30:00")
          })

        _task4 =
          PhoenixPayroll.FixtureHelper.task_fixture(%{
            shift_id: shift.id,
            task_type_id: pair_programming_task_type.id,
            start_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 12:30:00"),
            end_time: NaiveDateTime.from_iso8601!("#{Date.to_iso8601(date)} 16:30:00")
          })
      end)
    end)
  end,
  timeout: :infinity
)
