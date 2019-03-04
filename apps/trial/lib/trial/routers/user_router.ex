defmodule Trial.Routers.UserRouter do
  use Commanded.Commands.Router
  alias Trial.Aggregates.User
  alias Trial.Commands.RegisterUser

  dispatch RegisterUser, to: User, identity: :email_address
end
