defmodule WeatherForecast do
  @moduledoc """
  Pending
  """
  @adapter Application.get_env(:assignment, WeatherForecast)[:adapter]

  def get(lat, lon) do
    @adapter.get(lat, lon)
  end
end
