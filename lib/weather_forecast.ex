defmodule WeatherForecast do
  @moduledoc """
  Pending
  """
  @adapter Application.get_env(:weather_forecast, WeatherForecast)[:adapter]

  def get(lat, lon, cnt \\ 15) do
    @adapter.get(lat, lon, cnt)
  end
end
