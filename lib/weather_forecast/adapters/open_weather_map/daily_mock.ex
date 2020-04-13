defmodule WeatherForecast.Adapters.OpenWeatherMap.DailyMock do
  @moduledoc false

  def example do
    %{
      "city" => %{
        "country" => "JP",
        "geoname_id" => 1_907_296,
        "iso2" => "JP",
        "lat" => 35.0164,
        "lon" => 139.0077,
        "name" => "Tawarano",
        "population" => 0,
        "type" => ""
      },
      "cnt" => 10,
      "cod" => "200",
      "list" => [
        %{
          "clouds" => 0,
          "deg" => 311,
          "dt" => 1_485_741_600,
          "humidity" => 100,
          "pressure" => 1013.75,
          "speed" => 5.52,
          "temp" => %{
            "day" => 285.51,
            "eve" => 285.51,
            "max" => 285.51,
            "min" => 285.51,
            "morn" => 285.51,
            "night" => 285.51
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "sky is clear",
              "icon" => "01n",
              "id" => 800,
              "main" => "Clear"
            }
          ]
        },
        %{
          "clouds" => 0,
          "deg" => 66,
          "dt" => 1_485_828_000,
          "humidity" => 100,
          "pressure" => 1023.68,
          "speed" => 5.46,
          "temp" => %{
            "day" => 282.27,
            "eve" => 282.78,
            "max" => 284.66,
            "min" => 282.27,
            "morn" => 282.56,
            "night" => 284.66
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "sky is clear",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ]
        },
        %{
          "clouds" => 8,
          "deg" => 260,
          "dt" => 1_485_914_400,
          "humidity" => 100,
          "pressure" => 1017.39,
          "speed" => 13.76,
          "temp" => %{
            "day" => 284.83,
            "eve" => 285.49,
            "max" => 285.7,
            "min" => 283.21,
            "morn" => 283.21,
            "night" => 284.16
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "sky is clear",
              "icon" => "02d",
              "id" => 800,
              "main" => "Clear"
            }
          ]
        },
        %{
          "clouds" => 0,
          "deg" => 288,
          "dt" => 1_486_000_800,
          "humidity" => 100,
          "pressure" => 1017.36,
          "speed" => 8.95,
          "temp" => %{
            "day" => 283.71,
            "eve" => 284.76,
            "max" => 285.13,
            "min" => 281.86,
            "morn" => 281.86,
            "night" => 283.81
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "sky is clear",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ]
        },
        %{
          "clouds" => 0,
          "deg" => 295,
          "dt" => 1_486_087_200,
          "humidity" => 0,
          "pressure" => 996.2,
          "speed" => 5.92,
          "temp" => %{
            "day" => 280,
            "eve" => 283.75,
            "max" => 283.75,
            "min" => 275.68,
            "morn" => 275.68,
            "night" => 278.79
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ]
        },
        %{
          "clouds" => 0,
          "deg" => 314,
          "dt" => 1_486_173_600,
          "humidity" => 0,
          "pressure" => 998.07,
          "speed" => 3.71,
          "temp" => %{
            "day" => 279.4,
            "eve" => 283.22,
            "max" => 283.22,
            "min" => 276.69,
            "morn" => 276.69,
            "night" => 277.58
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "sky is clear",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ]
        },
        %{
          "clouds" => 66,
          "deg" => 337,
          "dt" => 1_486_260_000,
          "humidity" => 0,
          "pressure" => 997.4,
          "rain" => 0.28,
          "speed" => 2.1,
          "temp" => %{
            "day" => 280.88,
            "eve" => 284.66,
            "max" => 284.66,
            "min" => 276.28,
            "morn" => 276.28,
            "night" => 281.2
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ]
        },
        %{
          "clouds" => 4,
          "deg" => 2,
          "dt" => 1_486_346_400,
          "humidity" => 0,
          "pressure" => 991.11,
          "rain" => 3.72,
          "speed" => 2.69,
          "temp" => %{
            "day" => 281.58,
            "eve" => 283.76,
            "max" => 283.76,
            "min" => 278.74,
            "morn" => 279.15,
            "night" => 278.74
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10d",
              "id" => 501,
              "main" => "Rain"
            }
          ]
        },
        %{
          "clouds" => 47,
          "deg" => 353,
          "dt" => 1_486_432_800,
          "humidity" => 0,
          "pressure" => 993.37,
          "rain" => 0.52,
          "snow" => 0.03,
          "speed" => 2.05,
          "temp" => %{
            "day" => 277.62,
            "eve" => 281.14,
            "max" => 281.14,
            "min" => 275.86,
            "morn" => 275.86,
            "night" => 276.45
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "sky is clear",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ]
        },
        %{
          "clouds" => 2,
          "deg" => 326,
          "dt" => 1_486_519_200,
          "humidity" => 0,
          "pressure" => 991.72,
          "rain" => 0.35,
          "speed" => 3.47,
          "temp" => %{
            "day" => 279.26,
            "eve" => 281.61,
            "max" => 281.61,
            "min" => 275.51,
            "morn" => 275.51,
            "night" => 276.55
          },
          "feels_like" => %{
            "day" => 278.87,
            "night" => 282.73,
            "eve" => 281.92,
            "morn" => 278.87
          },
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ]
        }
      ]
    }
  end
end
