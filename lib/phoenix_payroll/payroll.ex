defmodule PhoenixPayroll.Payroll do
  @moduledoc """
  The Payroll context.
  """

  import Ecto.Query, warn: false
  alias PhoenixPayroll.Repo

  alias PhoenixPayroll.Payroll.Employee

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Repo.all(Employee)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id), do: Repo.get!(Employee, id)

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> Employee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{source: %Employee{}}

  """
  def change_employee(%Employee{} = employee) do
    Employee.changeset(employee, %{})
  end

  alias PhoenixPayroll.Payroll.Shift

  @doc """
  Returns the list of shifts.

  ## Examples

      iex> list_shifts()
      [%Shift{}, ...]

  """
  def list_shifts do
    Repo.all(Shift)
  end

  @doc """
  Gets a single shift.

  Raises `Ecto.NoResultsError` if the Shift does not exist.

  ## Examples

      iex> get_shift!(123)
      %Shift{}

      iex> get_shift!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shift!(id), do: Repo.get!(Shift, id)

  @doc """
  Creates a shift.

  ## Examples

      iex> create_shift(%{field: value})
      {:ok, %Shift{}}

      iex> create_shift(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shift(attrs \\ %{}) do
    %Shift{}
    |> Shift.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shift.

  ## Examples

      iex> update_shift(shift, %{field: new_value})
      {:ok, %Shift{}}

      iex> update_shift(shift, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shift(%Shift{} = shift, attrs) do
    shift
    |> Shift.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shift.

  ## Examples

      iex> delete_shift(shift)
      {:ok, %Shift{}}

      iex> delete_shift(shift)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shift(%Shift{} = shift) do
    Repo.delete(shift)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shift changes.

  ## Examples

      iex> change_shift(shift)
      %Ecto.Changeset{source: %Shift{}}

  """
  def change_shift(%Shift{} = shift) do
    Shift.changeset(shift, %{})
  end

  alias PhoenixPayroll.Payroll.TaskType

  @doc """
  Returns the list of task_types.

  ## Examples

      iex> list_task_types()
      [%TaskType{}, ...]

  """
  def list_task_types do
    Repo.all(TaskType)
  end

  @doc """
  Gets a single task_type.

  Raises `Ecto.NoResultsError` if the Task type does not exist.

  ## Examples

      iex> get_task_type!(123)
      %TaskType{}

      iex> get_task_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_type!(id), do: Repo.get!(TaskType, id)

  @doc """
  Creates a task_type.

  ## Examples

      iex> create_task_type(%{field: value})
      {:ok, %TaskType{}}

      iex> create_task_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_type(attrs \\ %{}) do
    %TaskType{}
    |> TaskType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_type.

  ## Examples

      iex> update_task_type(task_type, %{field: new_value})
      {:ok, %TaskType{}}

      iex> update_task_type(task_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_type(%TaskType{} = task_type, attrs) do
    task_type
    |> TaskType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task_type.

  ## Examples

      iex> delete_task_type(task_type)
      {:ok, %TaskType{}}

      iex> delete_task_type(task_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_type(%TaskType{} = task_type) do
    Repo.delete(task_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_type changes.

  ## Examples

      iex> change_task_type(task_type)
      %Ecto.Changeset{source: %TaskType{}}

  """
  def change_task_type(%TaskType{} = task_type) do
    TaskType.changeset(task_type, %{})
  end

  alias PhoenixPayroll.Payroll.WageType

  @doc """
  Returns the list of wage_types.

  ## Examples

      iex> list_wage_types()
      [%WageType{}, ...]

  """
  def list_wage_types do
    Repo.all(WageType)
  end

  @doc """
  Gets a single wage_type.

  Raises `Ecto.NoResultsError` if the Wage type does not exist.

  ## Examples

      iex> get_wage_type!(123)
      %WageType{}

      iex> get_wage_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wage_type!(id), do: Repo.get!(WageType, id)

  @doc """
  Creates a wage_type.

  ## Examples

      iex> create_wage_type(%{field: value})
      {:ok, %WageType{}}

      iex> create_wage_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wage_type(attrs \\ %{}) do
    %WageType{}
    |> WageType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wage_type.

  ## Examples

      iex> update_wage_type(wage_type, %{field: new_value})
      {:ok, %WageType{}}

      iex> update_wage_type(wage_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wage_type(%WageType{} = wage_type, attrs) do
    wage_type
    |> WageType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wage_type.

  ## Examples

      iex> delete_wage_type(wage_type)
      {:ok, %WageType{}}

      iex> delete_wage_type(wage_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wage_type(%WageType{} = wage_type) do
    Repo.delete(wage_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wage_type changes.

  ## Examples

      iex> change_wage_type(wage_type)
      %Ecto.Changeset{source: %WageType{}}

  """
  def change_wage_type(%WageType{} = wage_type) do
    WageType.changeset(wage_type, %{})
  end

  alias PhoenixPayroll.Payroll.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end
end
