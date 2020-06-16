defmodule PhoenixPayroll.Payroll do
  import Ecto.Query, warn: false
  alias PhoenixPayroll.Repo

  alias PhoenixPayroll.Payroll.WageType
  alias PhoenixPayroll.Payroll.PayrollRecord
  alias PhoenixPayroll.Shifts

  def create_payroll_record(attrs \\ %{}) do
    %PayrollRecord{}
    |> PayrollRecord.changeset(attrs)
    |> Repo.insert()
  end

  def create_payroll_records(records) do
    PayrollRecord
    |> Repo.insert_all(records)
  end

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

  def add_task_type(wage_type, task_type) do
    with {:ok, found_task_type} <- Shifts.get_task_type(task_type.id) do
      wage_type
      |> WageType.add_task_type_changeset(found_task_type)
      |> Repo.update()
    else
      err -> err
    end
  end
end
