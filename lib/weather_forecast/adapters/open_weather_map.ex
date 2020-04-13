defmodule WeatherForecast.Adapters.OpenWeatherMap do
  @moduledoc """
  Fetches the weather data using Open Weather Map's API.

  Requires an API key in the config.
  """

  alias WeatherForecast.Adapters.OpenWeatherMap.DailyParser
  alias WeatherForecast.Adapters.OpenWeatherMapHelper

  def get(lat, lon, cnt) do
    current_task = Task.async(fn -> current_weather(lat, lon) end)
    forecast_task = Task.async(fn -> forecast_weather(lat, lon, cnt) end)

    task_result =
      Enum.map([current_task, forecast_task], fn task -> Task.await(task, 145_000) end)

    case task_result do
      [{:ok, current_weather_data}, {:ok, forecast_weather_data}] ->
        {:ok, format(current_weather_data, forecast_weather_data)}

      _ ->
        {:error, "Error while requesting Open Weather Map's API"}
    end
  end

  def current_weather(lat, lon) do
    OpenWeatherMapHelper.fetch_current_weather(config(), lat, lon)
  end

  def forecast_weather(lat, lon, cnt) do
    OpenWeatherMapHelper.fetch_forecast_weather(config(), lat, lon, cnt)
  end

  defp date(current_weather) do
    current_weather["dt"]
    |> DateTime.from_unix!()
    |> DateTime.to_date()
    |> Date.to_iso8601()
  end

  defp sunrise(current_weather) do
    get_in(current_weather, ["sys", "sunrise"])
  end

  defp sunset(current_weather) do
    get_in(current_weather, ["sys", "sunset"])
  end

  defp temperature(current_weather) do
    get_in(current_weather, ["main", "temp"])
  end

  defp feels_like(current_weather) do
    get_in(current_weather, ["main", "feels_like"])
  end

  defp weathers(current_weather) do
    current_weather
    |> Map.get("weather")
    |> Enum.map(&parse_weather/1)
  end

  defp parse_weather(weather) do
    main = weather["main"]
    description = weather["description"]

    %{
      main: main,
      description: description
    }
  end

  def format(current_weather_data, daily_data) do
    %{
      date: date(current_weather_data),
      sunrise: sunrise(current_weather_data),
      sunset: sunset(current_weather_data),
      temperature: temperature(current_weather_data),
      feels_like: feels_like(current_weather_data),
      weather: weathers(current_weather_data),
      daily: DailyParser.format(daily_data)
    }
  end

  defp config do
    env = Application.get_env(:weather_forecast, WeatherForecast)
    %{api_key: env[:api_key]}
  end
end
