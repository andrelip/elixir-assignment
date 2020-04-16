defmodule WeatherForecast.Adapters.OpenWeatherMap.DailyParser do
  @moduledoc false
  def format(forecast_weather) do
    forecast_weather
    |> Enum.map(&parse_day/1)
  end

  defp parse_day(day) do
    %{
      date: date(day),
      pressure: pressure(day),
      humidity: humidity(day),
      temperature: temperature(day),
      feels_like: feels_like(day)
    }
  end

  defp date(day) do
    day["dt"]
    |> DateTime.from_unix!()
    |> DateTime.to_date()
    |> Date.to_iso8601()
  end

  defp pressure(day) do
    day["pressure"]
  end

  defp humidity(day) do
    day["humidity"]
  end

  defp temperature(day) do
    temp = day["temp"]

    %{
      day: temp["day"],
      evening: temp["eve"],
      max: temp["max"],
      min: temp["min"],
      morning: temp["morn"],
      night: temp["night"]
    }
  end

  defp feels_like(day) do
    feels_like = day["feels_like"]

    %{
      day: feels_like["day"],
      night: feels_like["night"],
      evening: feels_like["eve"],
      morning: feels_like["morn"]
    }
  end
end
