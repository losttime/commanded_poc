defmodule Trial.Aggregates.User do
  defstruct [:email_address, :password]

  alias Trial.Commands.RegisterUser
  alias Trial.Events.UserRegistered
  # Public command API

  def execute(%Trial.Aggregates.User{email_address: nil}, %RegisterUser{email_address: email_address, password: password}) do
    # This is where the business logic lives that determines whether or not something will happen
    IO.puts "executing registration command when existing is nil"
    %UserRegistered{email_address: email_address, password: password}
  end

  def execute(%Trial.Aggregates.User{}, %RegisterUser{email_address: _email_address, password: _password}) do
    # This is where the business logic lives that determines whether or not something will happen
    IO.puts "executing registration command when existing is not nil"
    {:error, :email_address_already_registered}
  end

  # def execute(entity, command) do
  #   IO.puts "attempting to execute"
  #   IO.inspect command, label: "command"
  #   IO.inspect entity, label: "entity"
  #   %UserRegistered{}
  # end

  # State mutators

  def apply(%Trial.Aggregates.User{} = account, %UserRegistered{email_address: email_address, password: password}) do
    # apply functions can never fail
    # we cannot reject an event once it has occurred
    IO.puts "applying registration event"
    %Trial.Aggregates.User{account |
      email_address: email_address,
      password: password
    }
  end
end
