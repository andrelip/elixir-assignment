defmodule AssignmentWeb.GraphQL.WeatherResolver do
  @moduledoc false

  def weather_forecast(%{input: input}, _) do
    WeatherForecast.get(input.latitude, input.longitude)
  end
end
