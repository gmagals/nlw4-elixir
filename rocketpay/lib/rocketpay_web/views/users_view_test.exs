defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase
  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView
  test "renders create.json" do
    params = %{
      name: "Rafael",
      password: "123456",
      nickname: "Camarda",
      email: "rafael@banana.com"
      age: 27
    }
    {:ok, %User{id: user_id, account:%Account{id: account_id}}} = user} = Rocketpay.create_use(params)

    response = render(RocketpayWeb.UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created.",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Rafael",
        nickname: "Camarda"
      }
    }
    assert expected_response == response
  end
end
