defmodule PhoenixPayroll.FixtureHelper do
  alias PhoenixPayroll.Employees

  def valid_employee_attrs, do: %{name: "some name"}
  def update_employee_attrs, do: %{name: "some updated name"}
  def invalid_employee_attrs, do: %{name: nil}

  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(valid_employee_attrs())
      |> Employees.create_employee()

    employee
  end

  alias PhoenixPayroll.Shifts

  def valid_shift_attrs(attrs \\ %{}) do
    employee_id =
      cond do
        Map.get(attrs, :employee_id) != nil -> attrs.employee_id
        true -> employee_fixture() |> Map.get(:id)
      end

    %{date: ~D[2010-04-17], employee_id: employee_id}
  end

  def update_shift_attrs, do: %{date: ~D[2011-05-18]}
  def invalid_shift_attrs, do: %{date: nil}

  def shift_fixture(attrs \\ %{}) do
    {:ok, shift} =
      attrs
      |> Enum.into(valid_shift_attrs(attrs))
      |> Shifts.create_shift()

    shift
  end

  def valid_task_type_attrs, do: %{task_type: "some task_type"}
  def update_task_type_attrs, do: %{task_type: "some updated task_type"}
  def invalid_task_type_attrs, do: %{task_type: nil}

  def task_type_fixture(attrs \\ %{}) do
    {:ok, task_type} =
      attrs
      |> Enum.into(valid_task_type_attrs())
      |> Shifts.create_task_type()

    task_type
  end

  def valid_task_attrs(attrs \\ %{}) do
    shift_id =
      cond do
        Map.get(attrs, :shift_id) != nil -> attrs.shift_id
        true -> shift_fixture() |> Map.get(:id)
      end

    task_type_id =
      cond do
        Map.get(attrs, :task_type_id) != nil -> attrs.task_type_id
        true -> task_type_fixture() |> Map.get(:id)
      end

    %{
      end_time: ~N[2010-04-17 14:00:00],
      start_time: ~N[2010-04-17 14:00:00],
      shift_id: shift_id,
      task_type_id: task_type_id
    }
  end

  def update_task_attrs,
    do: %{end_time: ~N[2011-05-18 15:01:01], start_time: ~N[2011-05-18 15:01:01]}

  def invalid_task_attrs, do: %{end_time: nil, start_time: nil}

  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(valid_task_attrs(attrs))
      |> Shifts.create_task()

    task
  end

  alias PhoenixPayroll.Payroll

  def valid_wage_type_attrs, do: %{wage_type: "some wage_type"}
  def update_wage_type_attrs, do: %{wage_type: "some updated wage_type"}
  def invalid_wage_type_attrs, do: %{wage_type: nil}

  def wage_type_fixture(attrs \\ %{}) do
    {:ok, wage_type} =
      attrs
      |> Enum.into(valid_wage_type_attrs())
      |> Payroll.create_wage_type()

    wage_type
  end
end
