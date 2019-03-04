# Commanded POC
Proof of concept for commanded

This is an umbrella app to facilitate future testing within an umbrella.

## Requirements

* Docker - for running the Event Store
* Elixir 1.7.4 - the latest version of Elixir supported by Extreme (Event Store client)
* Erlang/OTP 19.0 - Erlang version used to compile the related version of Elixir

We're using Elixir and Event Store versions that are slightly older than the most recent versions to comply with listed supported version on relevant libraries. Ideally, I'd love this to work with the recent versions of Erlang/OTP, Elixir, and Event Store too.

## Running

1. Start the Event Store in its own shell
   - `docker run -it -p 2113:2113 -p 1113:1113 -e EVENTSTORE_START_STANDARD_PROJECTIONS=true -e EVENTSTORE_RUN_PROJECTIONS=all eventstore/eventstore:release-4.0.3`
2. Prepare build in another shell
   - `mix deps.get`
3. Start Commanded POC
   - `iex -S mix`

When the application is running you can generate a new command in IEx by calling the register function. Then observe the behavior in the logs.
`Trial.register("a@example.com", "password")`

## Status

The application is able to connect to the Event Store and the command causes the aggregate to generate an event, add it to the Event Store, and update its own state. The event handler (`Trial.Handlers.Driven`) however does not receive the event. If the event handler name is changed and the application restarted, the newly renamed event handler will receive the previous message but will not receive any new ones. It will not receive any more until it is renamed again.
