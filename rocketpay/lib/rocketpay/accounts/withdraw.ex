defmodule Rocketpay.Accounts.Withdraw do

  alias Rocketpay.Repo
  alias Rocketpay.Accounts.Operation
    def call(%{"id" => id, "value" =>} = params) do
      params
      |> Operation.call(:deposit)
      |> run_transaction()
    end


    defp run_transaction(multi) do
      case Repo.transaction(multi) do
        {: error, _operation, reason, _changes} -> {:error, reason}
        {:ok, %{withdraw: account}} -> {:ok, account}
      end
    end
  end
