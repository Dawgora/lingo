defmodule Lingo.GameTest do
  use Lingo.DataCase

  alias Lingo.Game

  describe "users" do
    alias Lingo.Game.User

    import Lingo.GameFixtures

    @invalid_attrs %{name: nil, points: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Game.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Game.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", points: 42}

      assert {:ok, %User{} = user} = Game.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.points == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", points: 43}

      assert {:ok, %User{} = user} = Game.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.points == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_user(user, @invalid_attrs)
      assert user == Game.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Game.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Game.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Game.change_user(user)
    end
  end

  describe "words" do
    alias Lingo.Game.Word

    import Lingo.GameFixtures

    @invalid_attrs %{is_used: nil, name: nil}

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert Game.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert Game.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      valid_attrs = %{is_used: true, name: "some name"}

      assert {:ok, %Word{} = word} = Game.create_word(valid_attrs)
      assert word.is_used? == true
      assert word.name == "some name"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      update_attrs = %{is_used: false, name: "some updated name"}

      assert {:ok, %Word{} = word} = Game.update_word(word, update_attrs)
      assert word.is_used? == false
      assert word.name == "some updated name"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_word(word, @invalid_attrs)
      assert word == Game.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = Game.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> Game.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = Game.change_word(word)
    end
  end
end
