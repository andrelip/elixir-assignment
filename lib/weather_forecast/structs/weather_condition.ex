defmodule WeatherForecast.Structs.WeatherCondition do
  @moduledoc false

  # just to initialize the atoms
  @main_values [:thunderstorm, :drizzle, :rain, :snow, :mist, :smoke, :haze, :dust, :fog, :sand, :dust, :ash, :squall, :tornado, :clear, :clouds]

  defstruct [:main, :description]

  def main_values do
    @main_values
  end
end
