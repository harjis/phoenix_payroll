defmodule PhoenixPayrollWeb.Router do
  use PhoenixPayrollWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixPayrollWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", PhoenixPayrollWeb do
    pipe_through :api

    get "/payroll", PayrollController, :index
  end
end
