defmodule PhoenixPayroll.TaskTest do
  use PhoenixPayroll.DataCase
  import PhoenixPayroll.FixtureHelper

  alias PhoenixPayroll.Shifts.Task

  describe "#with_shift_date/3" do
    test "returns tasks filtered by shifts date " do
      start_date = ~D[2000-01-02]
      end_date = ~D[2000-01-02]
      _shift_before_time_range = shift_fixture(%{date: ~D[2000-01-01]})
      shift_in_time_range = shift_fixture(%{date: start_date})
      task = task_fixture(%{shift_id: shift_in_time_range.id})

      actual = Task.with_shift_date(Task, start_date, end_date) |> Repo.all()

      expected = [
        task
      ]

      assert actual == expected
    end
  end
end
