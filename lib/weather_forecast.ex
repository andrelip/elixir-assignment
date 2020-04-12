defmodule WeatherForecast do
  @moduledoc """
  Pending
  """
  @adapter Application.get_env(:weather_forecast, WeatherForecast)[:adapter]

  def current_weather(lat, lon) do
    @adapter.current_weather(lat, lon)
  end
end
