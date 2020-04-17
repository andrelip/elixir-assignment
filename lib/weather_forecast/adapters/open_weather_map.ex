defmodule WeatherForecast.Adapters.OpenWeatherMap do
  @moduledoc """
  Fetches the weather data using Open Weather Map's API.

  Requires an API key in the config.
  """

  alias WeatherForecast.Adapters.OpenWeatherMap.DailyParser
  alias WeatherForecast.Adapters.OpenWeatherMap.Helper, as: OpenWeatherMapHelper
  alias WeatherForecast.Structs.WeatherInformation
  alias WeatherForecast.Structs.WeatherCondition


  @doc """
  Receives a geo-position and returns detailed weather data for today and the
  following days.

  ## Example:
      iex> WeatherForecast.Adapters.OpenWeatherMap.get("52.3667", "4.8945")
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
    with {:ok, weather_data} <- fetch(lat, lon) do
      {:ok, format(weather_data)}
    end
  end

  defp fetch(lat, lon) do
    OpenWeatherMapHelper.fetch_weather(config(), lat, lon)
  end

  defp date(current_weather) do
    current_weather["dt"]
    |> DateTime.from_unix!()
    |> DateTime.to_date()
    |> Date.to_iso8601()
  end

  defp sunrise(current_weather) do
    current_weather["sunrise"]
  end

  defp sunset(current_weather) do
    current_weather["sunset"]
  end

  defp temperature(current_weather) do
    current_weather["temp"]
  end

  defp feels_like(current_weather) do
    current_weather["feels_like"]
  end

  defp weather_conditions(current_weather) do
    current_weather
    |> Map.get("weather")
    |> Enum.map(&parse_weather/1)
  end

  defp parse_weather(weather) do
    main = weather["main"]
    description = weather["description"]

    %WeatherCondition{
      main: main,
      description: description
    }
  end

  defp format(weather_info) do
    current = weather_info["current"]
    forecast = weather_info["daily"]

    %WeatherInformation{
      date: date(current),
      sunrise: sunrise(current),
      sunset: sunset(current),
      temperature: temperature(current),
      feels_like: feels_like(current),
      weather_conditions: weather_conditions(current),
      daily: DailyParser.format(forecast)
    }
  end

  defp config do
    env = Application.get_env(:assignment, WeatherForecast)
    %{api_key: env[:api_key]}
  end
end
