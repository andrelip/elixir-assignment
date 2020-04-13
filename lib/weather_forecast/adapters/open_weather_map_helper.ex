defmodule WeatherForecast.Adapters.OpenWeatherMapHelper do
  @moduledoc """
  Functions for using features specific to OpenWeatherMap
  (e.g. requesting, formating).
  """

  alias WeatherForecast.Adapters.HTTPHelper
  alias WeatherForecast.Adapters.OpenWeatherMap.DailyMock

  @base_uri "https://api.openweathermap.org/data/2.5"

  def fetch_current_weather(config, lat, lon) do
    HTTPHelper.get(current_full_uri(), lat: lat, lon: lon, appid: config.api_key)
  end

  defp current_full_uri do
    @base_uri <> "/weather"
  end

  def fetch_forecast_weather(config, lat, lon, ctn) do
    case Application.get_env(:weather_forecast, WeatherForecast)[:mock_forecast] do
      true ->
        {:ok, DailyMock.example()}

      false ->
        HTTPHelper.get(forecast_full_uri(), lat: lat, lon: lon, ctn: ctn, appid: config.api_key)
    end
  end

  defp forecast_full_uri do
    @base_uri <> "/forecast/daily"
  end
end
