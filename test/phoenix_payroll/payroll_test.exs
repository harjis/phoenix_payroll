defmodule PhoenixPayroll.PayrollTest do
  use PhoenixPayroll.DataCase

  alias PhoenixPayroll.Payroll

  describe "employees" do
    alias PhoenixPayroll.Payroll.Employee

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payroll.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Payroll.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Payroll.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Payroll.create_employee(@valid_attrs)
      assert employee.name == "some name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payroll.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = Payroll.update_employee(employee, @update_attrs)
      assert employee.name == "some updated name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Payroll.update_employee(employee, @invalid_attrs)
      assert employee == Payroll.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Payroll.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Payroll.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Payroll.change_employee(employee)
    end
  end

  describe "shifts" do
    alias PhoenixPayroll.Payroll.Shift

    @valid_attrs %{date: ~D[2010-04-17]}
    @update_attrs %{date: ~D[2011-05-18]}
    @invalid_attrs %{date: nil}

    def shift_fixture(attrs \\ %{}) do
      {:ok, shift} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payroll.create_shift()

      shift
    end

    test "list_shifts/0 returns all shifts" do
      shift = shift_fixture()
      assert Payroll.list_shifts() == [shift]
    end

    test "get_shift!/1 returns the shift with given id" do
      shift = shift_fixture()
      assert Payroll.get_shift!(shift.id) == shift
    end

    test "create_shift/1 with valid data creates a shift" do
      assert {:ok, %Shift{} = shift} = Payroll.create_shift(@valid_attrs)
      assert shift.date == ~D[2010-04-17]
    end

    test "create_shift/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payroll.create_shift(@invalid_attrs)
    end

    test "update_shift/2 with valid data updates the shift" do
      shift = shift_fixture()
      assert {:ok, %Shift{} = shift} = Payroll.update_shift(shift, @update_attrs)
      assert shift.date == ~D[2011-05-18]
    end

    test "update_shift/2 with invalid data returns error changeset" do
      shift = shift_fixture()
      assert {:error, %Ecto.Changeset{}} = Payroll.update_shift(shift, @invalid_attrs)
      assert shift == Payroll.get_shift!(shift.id)
    end

    test "delete_shift/1 deletes the shift" do
      shift = shift_fixture()
      assert {:ok, %Shift{}} = Payroll.delete_shift(shift)
      assert_raise Ecto.NoResultsError, fn -> Payroll.get_shift!(shift.id) end
    end

    test "change_shift/1 returns a shift changeset" do
      shift = shift_fixture()
      assert %Ecto.Changeset{} = Payroll.change_shift(shift)
    end
  end

  describe "task_types" do
    alias PhoenixPayroll.Payroll.TaskType

    @valid_attrs %{task_type: "some task_type"}
    @update_attrs %{task_type: "some updated task_type"}
    @invalid_attrs %{task_type: nil}

    def task_type_fixture(attrs \\ %{}) do
      {:ok, task_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payroll.create_task_type()

      task_type
    end

    test "list_task_types/0 returns all task_types" do
      task_type = task_type_fixture()
      assert Payroll.list_task_types() == [task_type]
    end

    test "get_task_type!/1 returns the task_type with given id" do
      task_type = task_type_fixture()
      assert Payroll.get_task_type!(task_type.id) == task_type
    end

    test "create_task_type/1 with valid data creates a task_type" do
      assert {:ok, %TaskType{} = task_type} = Payroll.create_task_type(@valid_attrs)
      assert task_type.task_type == "some task_type"
    end

    test "create_task_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payroll.create_task_type(@invalid_attrs)
    end

    test "update_task_type/2 with valid data updates the task_type" do
      task_type = task_type_fixture()
      assert {:ok, %TaskType{} = task_type} = Payroll.update_task_type(task_type, @update_attrs)
      assert task_type.task_type == "some updated task_type"
    end

    test "update_task_type/2 with invalid data returns error changeset" do
      task_type = task_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Payroll.update_task_type(task_type, @invalid_attrs)
      assert task_type == Payroll.get_task_type!(task_type.id)
    end

    test "delete_task_type/1 deletes the task_type" do
      task_type = task_type_fixture()
      assert {:ok, %TaskType{}} = Payroll.delete_task_type(task_type)
      assert_raise Ecto.NoResultsError, fn -> Payroll.get_task_type!(task_type.id) end
    end

    test "change_task_type/1 returns a task_type changeset" do
      task_type = task_type_fixture()
      assert %Ecto.Changeset{} = Payroll.change_task_type(task_type)
    end
  end

  describe "wage_types" do
    alias PhoenixPayroll.Payroll.WageType

    @valid_attrs %{wage_type: "some wage_type"}
    @update_attrs %{wage_type: "some updated wage_type"}
    @invalid_attrs %{wage_type: nil}

    def wage_type_fixture(attrs \\ %{}) do
      {:ok, wage_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payroll.create_wage_type()

      wage_type
    end

    test "list_wage_types/0 returns all wage_types" do
      wage_type = wage_type_fixture()
      assert Payroll.list_wage_types() == [wage_type]
    end

    test "get_wage_type!/1 returns the wage_type with given id" do
      wage_type = wage_type_fixture()
      assert Payroll.get_wage_type!(wage_type.id) == wage_type
    end

    test "create_wage_type/1 with valid data creates a wage_type" do
      assert {:ok, %WageType{} = wage_type} = Payroll.create_wage_type(@valid_attrs)
      assert wage_type.wage_type == "some wage_type"
    end

    test "create_wage_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payroll.create_wage_type(@invalid_attrs)
    end

    test "update_wage_type/2 with valid data updates the wage_type" do
      wage_type = wage_type_fixture()
      assert {:ok, %WageType{} = wage_type} = Payroll.update_wage_type(wage_type, @update_attrs)
      assert wage_type.wage_type == "some updated wage_type"
    end

    test "update_wage_type/2 with invalid data returns error changeset" do
      wage_type = wage_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Payroll.update_wage_type(wage_type, @invalid_attrs)
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
  end

  describe "tasks" do
    alias PhoenixPayroll.Payroll.Task

    @valid_attrs %{end_time: ~N[2010-04-17 14:00:00], start_time: ~N[2010-04-17 14:00:00]}
    @update_attrs %{end_time: ~N[2011-05-18 15:01:01], start_time: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payroll.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Payroll.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Payroll.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Payroll.create_task(@valid_attrs)
      assert task.end_time == ~N[2010-04-17 14:00:00]
      assert task.start_time == ~N[2010-04-17 14:00:00]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payroll.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Payroll.update_task(task, @update_attrs)
      assert task.end_time == ~N[2011-05-18 15:01:01]
      assert task.start_time == ~N[2011-05-18 15:01:01]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Payroll.update_task(task, @invalid_attrs)
      assert task == Payroll.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Payroll.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Payroll.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Payroll.change_task(task)
    end
  end
end
