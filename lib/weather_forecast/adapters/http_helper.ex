defmodule WeatherForecast.Adapters.HTTPHelper do
  @moduledoc """
  An abstraction of the HTTP client to be used for the different adapters of the
  WeatherForecast.
  """
  require Logger

  def get(uri, query) do
    res = Tesla.get(uri, query: query)

    case res do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %Tesla.Env{status: status, body: body}} ->
        error_msg = """
        Request failed
        URI: #{uri}
        Params: #{inspect(query)}
        Status #{status}
        Body: #{body}
        """

        Logger.error(error_msg)
        {:error, "Request returned code #{status}"}

      error ->
        error_msg = """
        Request failed
        URI: #{uri}
        Params: #{inspect(query)}
        Error: #{inspect(error)}
        """

        Logger.error(error_msg)
        {:error, "Bad request"}
    end
  end
end
