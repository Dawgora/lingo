defmodule Lingo.Game.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :is_used?, :boolean, default: false
    field :name, :string, size: 5

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:name, :is_used?])
    |> validate_required([:name, :is_used?])
    |> validate_length(:name, max: 5)
  end
end
