defmodule WeatherForecast.Adapter do
  @moduledoc ~S"""
  Behaviour for creating WeatherForecast adapters

  We are expecting all the data to be formatted based on the structs of this
  module.

  ## Example

      defmodule WeatherForecast.Adapters.CustomAdapter do
        @behaviour WeatherForecast.Adapter

        def get(lat, lon) do
          get_data_somehow(lat, lon)
        end

        ...
      end
  """

  alias WeatherForecast.Structs.WeatherInformation

  @callback get(WeatherForecast.lat, WeatherForecast.lon) :: {:ok, %WeatherInformation{}} | {:error, String.t}
end
