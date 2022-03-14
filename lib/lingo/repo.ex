defmodule Lingo.Repo do
  use Ecto.Repo,
    otp_app: :lingo,
    adapter: Ecto.Adapters.Postgres
end
