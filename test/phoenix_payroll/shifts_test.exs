defmodule PhoenixPayroll.ShiftsTest do
  use PhoenixPayroll.DataCase
  import PhoenixPayroll.FixtureHelper

  alias PhoenixPayroll.Shifts

  describe "shifts" do
    alias PhoenixPayroll.Shifts.Shift

    test "list_shifts/0 returns all shifts" do
      shift = shift_fixture()
      assert Shifts.list_shifts() == [shift]
    end

    test "get_shift!/1 returns the shift with given id" do
      shift = shift_fixture()
      assert Shifts.get_shift!(shift.id) == shift
    end

    test "create_shift/1 with valid data creates a shift" do
      assert {:ok, %Shift{} = shift} = Shifts.create_shift(valid_shift_attrs())
      assert shift.date == ~D[2010-04-17]
    end

    test "create_shift/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shifts.create_shift(invalid_shift_attrs())
    end

    test "update_shift/2 with valid data updates the shift" do
      shift = shift_fixture()
      assert {:ok, %Shift{} = shift} = Shifts.update_shift(shift, update_shift_attrs())
      assert shift.date == ~D[2011-05-18]
    end

    test "update_shift/2 with invalid data returns error changeset" do
      shift = shift_fixture()
      assert {:error, %Ecto.Changeset{}} = Shifts.update_shift(shift, invalid_shift_attrs())
      assert shift == Shifts.get_shift!(shift.id)
    end

    test "delete_shift/1 deletes the shift" do
      shift = shift_fixture()
      assert {:ok, %Shift{}} = Shifts.delete_shift(shift)
      assert_raise Ecto.NoResultsError, fn -> Shifts.get_shift!(shift.id) end
    end

    test "change_shift/1 returns a shift changeset" do
      shift = shift_fixture()
      assert %Ecto.Changeset{} = Shifts.change_shift(shift)
    end
  end

  describe "task_types" do
    alias PhoenixPayroll.Shifts.TaskType

    test "list_task_types/0 returns all task_types" do
      task_type = task_type_fixture()
      assert Shifts.list_task_types() == [task_type]
    end

    test "get_task_type!/1 returns the task_type with given id" do
      task_type = task_type_fixture()
      assert Shifts.get_task_type!(task_type.id) == task_type
    end

    test "create_task_type/1 with valid data creates a task_type" do
      assert {:ok, %TaskType{} = task_type} = Shifts.create_task_type(valid_task_type_attrs())
      assert task_type.task_type == "some task_type"
    end

    test "create_task_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shifts.create_task_type(invalid_task_type_attrs())
    end

    test "update_task_type/2 with valid data updates the task_type" do
      task_type = task_type_fixture()

      assert {:ok, %TaskType{} = task_type} =
               Shifts.update_task_type(task_type, update_task_type_attrs())

      assert task_type.task_type == "some updated task_type"
    end

    test "update_task_type/2 with invalid data returns error changeset" do
      task_type = task_type_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Shifts.update_task_type(task_type, invalid_task_type_attrs())

      assert task_type == Shifts.get_task_type!(task_type.id)
    end

    test "delete_task_type/1 deletes the task_type" do
      task_type = task_type_fixture()
      assert {:ok, %TaskType{}} = Shifts.delete_task_type(task_type)
      assert_raise Ecto.NoResultsError, fn -> Shifts.get_task_type!(task_type.id) end
    end

    test "change_task_type/1 returns a task_type changeset" do
      task_type = task_type_fixture()
      assert %Ecto.Changeset{} = Shifts.change_task_type(task_type)
    end
  end

  describe "tasks" do
    alias PhoenixPayroll.Shifts.Task

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Shifts.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Shifts.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Shifts.create_task(valid_task_attrs())
      assert task.end_time == ~N[2010-04-17 14:00:00]
      assert task.start_time == ~N[2010-04-17 14:00:00]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shifts.create_task(invalid_task_attrs())
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Shifts.update_task(task, update_task_attrs())
      assert task.end_time == ~N[2011-05-18 15:01:01]
      assert task.start_time == ~N[2011-05-18 15:01:01]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Shifts.update_task(task, invalid_task_attrs())
      assert task == Shifts.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Shifts.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Shifts.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Shifts.change_task(task)
    end
  end
end
