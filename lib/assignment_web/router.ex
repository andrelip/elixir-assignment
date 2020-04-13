defmodule AssignmentWeb.Router do
  use AssignmentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: AssignmentWeb.GraphQL.WeatherForecastSchema,
      interface: :playground

    forward "/graphql", Absinthe.Plug, schema: BankingWeb.GraphQL.Schema
  end
end
