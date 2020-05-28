defmodule PhoenixPayrollWeb.PageController do
  use PhoenixPayrollWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
