defmodule Assignment.WeatherForecastTest do
  use ExUnit.Case

  alias Assignment.WeatherForecast

  test "get/2 should show the weather information based on Latitude and Longitude" do
    {:ok, data} = WeatherForecast.get("52.3667", "4.8945")

    assert data.date == "2020-04-16"
    assert data.feels_like == 288.72
    assert data.sunrise == 1_587_011_988
    assert data.sunset == 1_587_062_405
    assert data.temperature == 292.59
    assert data.weather_conditions == [%{description: "few clouds", main: "Clouds"}]

    day = data.daily |> List.first()

    assert day.date == "2020-04-16"
    assert day.feels_like == %{night: 277.79, day: 289.87, evening: 284.01, morning: 289.87}
    assert day.humidity == 45
    assert day.pressure == 1016

    assert day.temperature == %{
             min: 281.96,
             night: 281.96,
             day: 292.59,
             evening: 287.43,
             max: 292.59,
             morning: 292.59
           }
  end
end
