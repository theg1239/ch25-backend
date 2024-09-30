defmodule Ch25Backend.AnswersTest do
  use Ch25Backend.DataCase

  alias Ch25Backend.Answers

  describe "answers" do
    alias Ch25Backend.Answers.Answer

    import Ch25Backend.AnswersFixtures

    @invalid_attrs %{answer: nil, points_awarded: nil, submitted_at: nil}

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Answers.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Answers.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      valid_attrs = %{answer: "some answer", points_awarded: 42, submitted_at: ~U[2024-09-29 11:51:00Z]}

      assert {:ok, %Answer{} = answer} = Answers.create_answer(valid_attrs)
      assert answer.answer == "some answer"
      assert answer.points_awarded == 42
      assert answer.submitted_at == ~U[2024-09-29 11:51:00Z]
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Answers.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      update_attrs = %{answer: "some updated answer", points_awarded: 43, submitted_at: ~U[2024-09-30 11:51:00Z]}

      assert {:ok, %Answer{} = answer} = Answers.update_answer(answer, update_attrs)
      assert answer.answer == "some updated answer"
      assert answer.points_awarded == 43
      assert answer.submitted_at == ~U[2024-09-30 11:51:00Z]
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Answers.update_answer(answer, @invalid_attrs)
      assert answer == Answers.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Answers.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Answers.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Answers.change_answer(answer)
    end
  end
end
