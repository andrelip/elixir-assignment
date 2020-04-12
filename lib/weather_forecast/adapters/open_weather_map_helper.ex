defmodule WeatherForecast.Adapters.OpenWeatherMapHelper do
  @moduledoc """
  Functions for using features specific to OpenWeatherMap
  (e.g. requesting, formating).
  """

  alias WeatherForecast.Adapters.HTTPHelper

  @base_uri "https://api.openweathermap.org/data/2.5"

  def fetch_current_weather(config, lat, lon) do
    HTTPHelper.get(current_full_uri(), lat: lat, lon: lon, appid: config.api_key)
  end

  defp current_full_uri do
    @base_uri <> "/weather"
  end
end