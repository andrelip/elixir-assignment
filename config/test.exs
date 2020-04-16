use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :assignment, AssignmentWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :weather_forecast, WeatherForecast,
  adapter: WeatherForecast.Adapters.Test,
  api_key:
    System.get_env("OPENWEATHERMAP_APIKEY") ||
      raise("""
      environment variable OPENWEATHERMAP_APIKEY is missing.
      You can generate one by accessing the following URL:
      https://openweathermap.org/api

      This key is required for refreshing the VCR Cache
      """)
