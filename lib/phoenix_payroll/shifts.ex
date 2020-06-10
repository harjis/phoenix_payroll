defmodule PhoenixPayroll.Shifts do
  @moduledoc """
  The Payroll context.
  """

  import Ecto.Query, warn: false
  alias PhoenixPayroll.Repo

  alias PhoenixPayroll.Shifts.Shift

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

  alias PhoenixPayroll.Shifts.TaskType

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

  def get_task_type(id) do
    TaskType
    |> Repo.get(id)
    |> case do
         nil -> {:error, :not_found}
         task_type -> {:ok, task_type}
       end
  end

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

  alias PhoenixPayroll.Shifts.Task

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
