defmodule PhoenixPayroll.WageTypeTest do
  use PhoenixPayroll.DataCase
  import PhoenixPayroll.FixtureHelper

  alias PhoenixPayroll.Payroll.WageType

  describe "#add_task_type_changeset/2" do
    test "returns changeset" do
      wage_type = wage_type_fixture()
      task_type = task_type_fixture()

      changeset = WageType.add_task_type_changeset(wage_type, task_type)
      assert %Ecto.Changeset{} = changeset
      assert changeset.valid?
    end
  end
end
