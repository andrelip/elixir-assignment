defmodule WeatherForecast.Adapters.OpenWeatherMapTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias WeatherForecast.Adapters.OpenWeatherMap

  test "get/2 should fetch formatted data from Open Weather API" do
    use_cassette "Open Weather API - OPEN API" do
      {:ok, data} = OpenWeatherMap.get("52.3667", "4.8945")

      assert data.date == "2020-04-16"
      assert data.feels_like == 289.29
      assert data.sunrise == 1_587_011_988
      assert data.sunset == 1_587_062_405
      assert data.temperature == 292.67
      assert data.weather == [%{description: "few clouds", main: "Clouds"}]

      day = data.daily |> List.first()

      assert day.date == "2020-04-16"
      assert day.feels_like == %{day: 289.74, evening: 284.04, morning: 289.74, night: 277.79}
      assert day.humidity == 42
      assert day.pressure == 1016

      assert day.temperature == %{
               day: 292.67,
               evening: 287.45,
               max: 292.67,
               min: 281.96,
               morning: 292.67,
               night: 281.96
             }
    end
  end
end