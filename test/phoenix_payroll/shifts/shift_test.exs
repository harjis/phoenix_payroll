defmodule PhoenixPayroll.ShiftTest do
  use PhoenixPayroll.DataCase
  import PhoenixPayroll.FixtureHelper

  alias PhoenixPayroll.Shifts.Shift

  describe "#between_time_range/3" do
    test "returns shifts between time range" do
      start_date = ~D[2000-01-02]
      end_date = ~D[2000-01-02]
      _shift_before_time_range = shift_fixture(%{date: ~D[2000-01-01]})
      shift_in_time_range = shift_fixture(%{date: start_date})
      _shift_after_time_range = shift_fixture(%{date: ~D[2000-01-03]})

      assert Shift.between_time_range(Shift, start_date, end_date) |> Repo.all() == [
               shift_in_time_range
             ]
    end
  end
end
