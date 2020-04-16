defmodule AssignmentWeb.GraphQL.Query.WeatherTest do
  use Assignment.DataCase
  use Wormwood.GQLCase

  load_gql(
    AssignmentWeb.GraphQL.WeatherForecastSchema,
    "test/assignment_web/views/graphql/gql/weather.gql"
  )

  test "syntax should be right" do
    result =
      query_gql(variables: %{"input" => %{"latitude" => "52.3667", "longitude" => "4.8945"}})

    assert {:ok, data} = result
  end

  test "should parse well" do
    result =
      query_gql(variables: %{"input" => %{"latitude" => "52.3667", "longitude" => "4.8945"}})

    {:ok, %{data: %{"weatherForecast" => weather_info}}} = result

    assert weather_info["date"] == "2020-04-16"
    assert weather_info["feelsLike"] == 288.72
    assert weather_info["sunrise"] == 1_587_011_988
    assert weather_info["sunset"] == 1_587_062_405
    assert weather_info["temperature"] == 292.59

    assert weather_info["weatherConditions"] == [
             %{"description" => "few clouds", "main" => "Clouds"}
           ]

    day = weather_info["daily"] |> List.first()

    assert day["date"] == "2020-04-16"
    assert day["humidity"] == 45
    assert day["pressure"] == 1016

    assert day["feelsLike"] == [
             %{
               "day" => 289.87,
               "evening" => 284.01,
               "morning" => 289.87,
               "night" => 277.79
             }
           ]

    assert day["temperature"] == [
             %{
               "day" => 292.59,
               "evening" => 287.43,
               "max" => 292.59,
               "min" => 281.96,
               "morning" => 292.59,
               "night" => 281.96
             }
           ]
  end
end
