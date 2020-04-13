defmodule AssignmentWeb.GraphQL.WeatherForecastSchema do
  @moduledoc """
  Defines the main GraphQL's schema used by absinthe.
  """

  use Absinthe.Schema

  alias AssignmentWeb.GraphQL.WeatherResolver

  import_types(AssignmentWeb.GraphQL.WeatherTypes)

  query do
    field :weather_forecast, :weather_information do
      arg(:input, :coordinate_input)

      resolve(&WeatherResolver.weather_forecast/2)
    end
  end
end
