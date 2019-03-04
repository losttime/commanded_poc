# Since configuration is shared in umbrella projects, this file
# should only configure the :trial application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :commanded, event_store_adapter: Commanded.EventStore.Adapters.Extreme

config :extreme, :event_store,
  db_type: :node,
  host: "localhost",
  port: 1113,
  username: "admin",
  password: "changeit",
  reconnect_delay: 2_000,
  max_attempts: :infinity

config :extreme, :protocol_version, 4

config :commanded_extreme_adapter,
  serializer: Commanded.Serialization.JsonSerializer,
  stream_prefix: "commandeddev"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
