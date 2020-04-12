defmodule WeatherForecast.Adapters.OpenWeatherMap do
  @moduledoc """
  Fetches the weather data using Open Weather Map's API.

  Requires an API key in the config.
  """

  alias WeatherForecast.Adapters.OpenWeatherMapHelper

  def current_weather(lat, lon) do
    OpenWeatherMapHelper.fetch_current_weather(config(), lat, lon)
  end

  defp config do
    env = Application.get_env(:weather_forecast, WeatherForecast)
    %{api_key: env[:api_key]}
  end
end
