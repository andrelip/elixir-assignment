defmodule Assignment.WeatherForecast do
  @moduledoc """
  This module contains functions to fetch weather information
  """

  @doc """
  Receives a geo-position and returns detailed weather data for today and the
  following days.

  ## Example:
      iex> Assignment.WeatherForecast.get("52.3667", "4.8945")
      {:ok,
      %{
        daily: [
          %{
            date: "2020-04-16",
            feels_like: %{
              day: 284.52,
              evening: 284.52,
              morning: 284.52,
              night: 278.03
            },
            ...
        ],
        date: "2020-04-16",
        feels_like: 284.5,
        sunrise: 1587011988,
        sunset: 1587062405,
        temperature: 288.31,
        weather_conditions: [%{description: "broken clouds", main: "Clouds"}]
      }}
  """
  def get(lat, lon) do
    WeatherForecast.get(lat, lon)
  end
end
