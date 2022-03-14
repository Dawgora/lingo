defmodule Lingo.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lingo.Game` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        points: 42
      })
      |> Lingo.Game.create_user()

    user
  end

  @doc """
  Generate a word.
  """
  def word_fixture(attrs \\ %{}) do
    {:ok, word} =
      attrs
      |> Enum.into(%{
        is_used?: true,
        name: "some name"
      })
      |> Lingo.Game.create_word()

    word
  end
end
