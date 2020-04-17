defmodule AssignmentWeb.GraphQL.WeatherTypes do
  @moduledoc false

  use Absinthe.Schema.Notation

  scalar :raw_json do
    serialize(& &1)
  end

  scalar :temperature do
    description("""
    The `Temperature` scalar type represents the temperature in Kelvin.
    """)

    serialize(& &1)
  end

  input_object :coordinate_input do
    field :latitude, non_null(:string),
      description: "Geographical coordinates of the location (latitude)"

    field :longitude, non_null(:string),
      description: "Geographical coordinates of the location (longitude)"
  end

  object :weather_information do
    field :date, :string, description: "The date in the ISO8601 standard"
    field :sunrise, :integer, description: "The time in the Unix timestamp notation"
    field :sunset, :integer, description: "The time in the Unix timestamp notation"
    field :temperature, :temperature
    field :feels_like, :temperature, description: "The human perception of weather"
    field :weather_conditions, list_of(:weather_conditions)
    field :daily, list_of(:daily), description: "Weather forecast for the next days"
  end

  object :weather_conditions do
    field :main, :weather_main, description: "Group of weather parameters (Rain, Snow, Extreme etc.)"
    field :description, :string, description: "Weather condition within the group"
  end

  object :daily do
    field :date, :string
    field :pressure, :float, description: "Pressure in hPa"
    field :humidity, :float, description: "Humidity in %"
    field :feels_like, list_of(:daily_feels_like), description: "The human perception of weather"
    field :temperature, list_of(:daily_temperature)
  end

  object :daily_feels_like do
    field :day, :temperature
    field :night, :temperature
    field :evening, :temperature
    field :morning, :temperature
  end

  object :daily_temperature do
    field :day, :temperature
    field :min, :temperature
    field :max, :temperature
    field :night, :temperature
    field :evening, :temperature
    field :morning, :temperature
  end

  enum :weather_main, values: [:thunderstorm, :drizzle, :clouds]
end
