defmodule PhoenixPayroll.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_payroll,
    adapter: Ecto.Adapters.Postgres
end
