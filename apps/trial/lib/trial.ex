defmodule Trial do
  alias Trial.Routers.UserRouter
  alias Trial.Commands.RegisterUser
  require Logger

  def register(email, password) do
    case UserRouter.dispatch(%RegisterUser{email_address: email, password: password}) do
      :ok ->
        Logger.info("Command dispatched")

      {:error, _reason} ->
        Logger.warn("Command refused")
    end    
  end
end
