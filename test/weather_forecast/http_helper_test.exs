defmodule WeatherForecast.Adapters.HTTPHelperTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import ExUnit.CaptureLog

  alias WeatherForecast.Adapters.HTTPHelper
  alias WeatherForecast.Adapters.OpenWeatherMap

  test "Should be OK for status code 200" do
    use_cassette "WeatherForecast.Adapters.HTTPHelperTest - Sucessful Scenario" do
      {:ok, data} = OpenWeatherMap.get("52.3667", "4.8945")
    end
  end

  test "Should log and return error for statuses different than 200" do
    use_cassette "WeatherForecast.Adapters.HTTPHelperTest - different than 200" do
      url = "https://api.openweathermap.org/data/2.5/onecall"

      params = %{
        lat: 52.3667,
        lon: 4.8945,
        app_id: "MISSING"
      }

      logged_msg = capture_log(fn -> HTTPHelper.get(url, params) end)
      assert logged_msg =~ "URI: https://api.openweathermap.org/data/2.5/onecall"
      assert logged_msg =~ "MISSING"
      assert logged_msg =~ "Status 401"

      assert logged_msg =~
               "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."

      assert {:error, _} = HTTPHelper.get(url, params)
    end
  end

  test "Should log and return error for general errors" do
    use_cassette "WeatherForecast.Adapters.HTTPHelperTest - general error" do
      url = "BADSOCKET://www.test.com"

      params = %{}

      logged_msg = capture_log(fn -> HTTPHelper.get(url, params) end)
      assert logged_msg =~ "URI: BADSOCKET://www.test.com"
      assert logged_msg =~ "Params: %{}"
      assert logged_msg =~ "Error: {:error, \"nxdomain\"}"

      assert {:error, _} = HTTPHelper.get(url, params)
    end
  end
end
