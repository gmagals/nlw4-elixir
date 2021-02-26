defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account
  alias Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = user} <- Rocketpay.deposit(params) do
    conn
    |> put_status(:ok)
    |> render("create.json", account: account)
    end
  end
  def withdraw(conn, params) do
    with {:ok, %Account{} = user} <- Rocketpay.withdraw(params) do
    conn
    |> put_status(:ok)
    |> render("create.json", account: account)
    end
  end
  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Rocketpay.transaction(params) do
    conn
    |> put_status(:ok)
    |> render("transaction.json", transaction: transaction)
    end
  end
end
