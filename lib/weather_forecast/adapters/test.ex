defmodule WeatherForecast.Adapters.Test do
  @moduledoc """
  Used for mocking a client for the WeatherForecast
  """
  @behaviour WeatherForecast.Adapter

  alias WeatherForecast.Structs.WeatherInformation
  alias WeatherForecast.Structs.DailyInformation
  alias WeatherForecast.Structs.DailyFeelsLike
  alias WeatherForecast.Structs.DailyTemperature
  alias WeatherForecast.Structs.WeatherCondition

  @spec get(WeatherForecast.lat, WeatherForecast.lon) :: {:ok, %WeatherInformation{}} | {:error, String.t}
  def get(_lat, _lon) do
    {:ok,
     %WeatherInformation{
       daily: [
         %DailyInformation{
           date: "2020-04-16",
           feels_like: %DailyFeelsLike{
             day: 289.87,
             evening: 284.01,
             morning: 289.87,
             night: 277.79
           },
           humidity: 45,
           pressure: 1016,
           temperature: %DailyTemperature{
             day: 292.59,
             evening: 287.43,
             max: 292.59,
             min: 281.96,
             morning: 292.59,
             night: 281.96
           }
         },
         %DailyInformation{
           date: "2020-04-17",
           feels_like: %DailyFeelsLike{
             day: 282.93,
             evening: 280.53,
             morning: 275.75,
             night: 275.98
           },
           humidity: 51,
           pressure: 1019,
           temperature: %DailyTemperature{
             day: 287.62,
             evening: 284.94,
             max: 288.29,
             min: 280.17,
             morning: 280.35,
             night: 280.17
           }
         },
         %DailyInformation{
           date: "2020-04-18",
           feels_like: %DailyFeelsLike{
             day: 281.89,
             evening: 283.06,
             morning: 276.51,
             night: 279.96
           },
           humidity: 65,
           pressure: 1017,
           temperature: %DailyTemperature{
             day: 284.56,
             evening: 285.64,
             max: 285.87,
             min: 280.98,
             morning: 280.98,
             night: 283.74
           }
         },
         %DailyInformation{
           date: "2020-04-19",
           feels_like: %DailyFeelsLike{
             day: 285.19,
             evening: 282.18,
             morning: 277.07,
             night: 276.77
           },
           humidity: 47,
           pressure: 1020,
           temperature: %DailyTemperature{
             day: 290.21,
             evening: 287.48,
             max: 290.86,
             min: 281.75,
             morning: 281.75,
             night: 283.19
           }
         },
         %DailyInformation{
           date: "2020-04-20",
           feels_like: %DailyFeelsLike{
             day: 280.46,
             evening: 278.81,
             morning: 273.65,
             night: 275.39
           },
           humidity: 37,
           pressure: 1021,
           temperature: %DailyTemperature{
             day: 288.35,
             evening: 286.01,
             max: 289.11,
             min: 280.68,
             morning: 280.68,
             night: 282.78
           }
         },
         %DailyInformation{
           date: "2020-04-21",
           feels_like: %DailyFeelsLike{
             day: 281.17,
             evening: 280.61,
             morning: 273.75,
             night: 276.94
           },
           humidity: 39,
           pressure: 1021,
           temperature: %DailyTemperature{
             day: 288.74,
             evening: 286.93,
             max: 289.84,
             min: 281.2,
             morning: 281.2,
             night: 282.7
           }
         },
         %DailyInformation{
           date: "2020-04-22",
           feels_like: %DailyFeelsLike{
             day: 283.44,
             evening: 283.85,
             morning: 275.21,
             night: 278.74
           },
           humidity: 40,
           pressure: 1018,
           temperature: %DailyTemperature{
             day: 289.37,
             evening: 287.89,
             max: 290.77,
             min: 280.95,
             morning: 280.95,
             night: 282.14
           }
         },
         %DailyInformation{
           date: "2020-04-23",
           feels_like: %DailyFeelsLike{
             day: 289.29,
             evening: 282.94,
             morning: 279.57,
             night: 279.98
           },
           humidity: 50,
           pressure: 1010,
           temperature: %DailyTemperature{
             day: 290.5,
             evening: 285.77,
             max: 290.5,
             min: 282.47,
             morning: 282.47,
             night: 283
           }
         }
       ],
       date: "2020-04-16",
       feels_like: 288.72,
       sunrise: 1_587_011_988,
       sunset: 1_587_062_405,
       temperature: 292.59,
       weather_conditions: [%WeatherCondition{description: "few clouds", main: :clouds}]
     }}
  end
end
