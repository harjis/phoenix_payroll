defmodule PhoenixPayroll.PayrollTest do
  use PhoenixPayroll.DataCase
  import PhoenixPayroll.FixtureHelper

  alias PhoenixPayroll.Payroll

  describe "wage_types" do
    alias PhoenixPayroll.Payroll.WageType

    test "list_wage_types/0 returns all wage_types" do
      wage_type = wage_type_fixture()
      assert Payroll.list_wage_types() == [wage_type]
    end

    test "get_wage_type!/1 returns the wage_type with given id" do
      wage_type = wage_type_fixture()
      assert Payroll.get_wage_type!(wage_type.id) == wage_type
    end

    test "create_wage_type/1 with valid data creates a wage_type" do
      assert {:ok, %WageType{} = wage_type} = Payroll.create_wage_type(valid_wage_type_attrs())
      assert wage_type.wage_type == "some wage_type"
    end

    test "create_wage_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payroll.create_wage_type(invalid_wage_type_attrs())
    end

    test "update_wage_type/2 with valid data updates the wage_type" do
      wage_type = wage_type_fixture()

      assert {:ok, %WageType{} = wage_type} =
               Payroll.update_wage_type(wage_type, update_wage_type_attrs())

      assert wage_type.wage_type == "some updated wage_type"
    end

    test "update_wage_type/2 with invalid data returns error changeset" do
      wage_type = wage_type_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Payroll.update_wage_type(wage_type, invalid_wage_type_attrs())

      assert wage_type == Payroll.get_wage_type!(wage_type.id)
    end

    test "delete_wage_type/1 deletes the wage_type" do
      wage_type = wage_type_fixture()
      assert {:ok, %WageType{}} = Payroll.delete_wage_type(wage_type)
      assert_raise Ecto.NoResultsError, fn -> Payroll.get_wage_type!(wage_type.id) end
    end

    test "change_wage_type/1 returns a wage_type changeset" do
      wage_type = wage_type_fixture()
      assert %Ecto.Changeset{} = Payroll.change_wage_type(wage_type)
    end

    test "add_task_type/2 with valid data adds a task type to wage type" do
      wage_type = wage_type_fixture()
      task_type = task_type_fixture()
      {:ok, wage_type} = Payroll.add_task_type(wage_type, task_type)
      assert length(wage_type.task_types) == 1
    end

    test "add_task_type/2 with invalid data does not add a task type to wage type" do
      wage_type = wage_type_fixture()
      {:error, _} = Payroll.add_task_type(wage_type, %{id: 0})
    end
  end
end
