defmodule Trial.Events.UserRegistered do
  @derive Jason.Encoder
  defstruct [:email_address, :password]
end
