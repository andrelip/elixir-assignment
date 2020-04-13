## How to use
- Set the environment variable `OPENWEATHERMAP_APIKEY` with your API key.
- Request `/graphql` or navigate through the API using GraphiQL in `/graphiql`

If your OpenWeatherMap account doesn't support the forecast feature, you can simulate a response using by using `mock_forecast: true` in the configuration.

## Setup

- [Phoenix](https://phoenixframework.org) has been set up and is available to run the application server.\
  Ecto has been disabled, as you won't need a database for this service, but can be enabled later if needed.
- [Absinthe](https://hexdocs.pm/absinthe) is included for the GraphQL API.
- [Tesla](https://hexdocs.pm/tesla) is included for the REST API.
- [ExUnit](https://hexdocs.pm/ex_unit) is also set up with some scaffolding in place. You must fill this in with your own tests.

## Example

Input:

```json
{
  "input": {
    "latitude": "52.3667",
    "longitude": "4.8945"
  }
}
```

Query:

```graphql
query WeatherForecast($input: CoordinateInput!) {
  weatherForecast(input: $input) {
    date
    sunrise
    sunset
    temperature
    feelsLike
    weather {
      main
      description
    }
    daily {
      date
      pressure
      humidity
      temperature {
        day
        min
        max
        night
        evening
        morning
      }
      feelsLike {
        day
        night
        evening
        morning
      }
    }
  }
}
```
