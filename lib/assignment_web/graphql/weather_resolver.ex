defmodule AssignmentWeb.GraphQL.WeatherResolver do
  @moduledoc false

  alias Assignment.WeatherForecast

  def weather_forecast(%{input: input}, _) do
    WeatherForecast.get(input.latitude, input.longitude)
  end
end
