defmodule AssignmentWeb.GraphQL.WeatherTypes do
  @moduledoc false

  use Absinthe.Schema.Notation

  scalar :raw_json do
    serialize(& &1)
  end

  input_object :coordinate_input do
    field :latitude, :string
    field :longitude, :string
  end

  object :weather_information do
    field :date, :string
    field :sunrise, :string
    field :sunset, :string
    field :temperature, :string
    field :feels_like, :string
    field :weather, list_of(:weather)
    field :daily, list_of(:daily)
  end

  object :weather do
    field :main, :string
    field :description, :string
  end

  object :daily do
    field :date, :string
    field :pressure, :string
    field :humidity, :string
    field :feels_like, list_of(:daily_feels_like)
    field :temperature, list_of(:daily_temperature)
  end

  object :daily_feels_like do
    field :day, :string
    field :night, :string
    field :evening, :string
    field :morning, :string
  end

  object :daily_temperature do
    field :day, :string
    field :min, :string
    field :max, :string
    field :night, :string
    field :evening, :string
    field :morning, :string
  end
end
