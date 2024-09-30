defmodule Ch25Backend.CheckInsTest do
  use Ch25Backend.DataCase

  alias Ch25Backend.CheckIns

  describe "check_ins" do
    alias Ch25Backend.CheckIns.CheckIn

    import Ch25Backend.CheckInsFixtures

    @invalid_attrs %{checked_in_at: nil}

    test "list_check_ins/0 returns all check_ins" do
      check_in = check_in_fixture()
      assert CheckIns.list_check_ins() == [check_in]
    end

    test "get_check_in!/1 returns the check_in with given id" do
      check_in = check_in_fixture()
      assert CheckIns.get_check_in!(check_in.id) == check_in
    end

    test "create_check_in/1 with valid data creates a check_in" do
      valid_attrs = %{checked_in_at: ~U[2024-09-29 11:51:00Z]}

      assert {:ok, %CheckIn{} = check_in} = CheckIns.create_check_in(valid_attrs)
      assert check_in.checked_in_at == ~U[2024-09-29 11:51:00Z]
    end

    test "create_check_in/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CheckIns.create_check_in(@invalid_attrs)
    end

    test "update_check_in/2 with valid data updates the check_in" do
      check_in = check_in_fixture()
      update_attrs = %{checked_in_at: ~U[2024-09-30 11:51:00Z]}

      assert {:ok, %CheckIn{} = check_in} = CheckIns.update_check_in(check_in, update_attrs)
      assert check_in.checked_in_at == ~U[2024-09-30 11:51:00Z]
    end

    test "update_check_in/2 with invalid data returns error changeset" do
      check_in = check_in_fixture()
      assert {:error, %Ecto.Changeset{}} = CheckIns.update_check_in(check_in, @invalid_attrs)
      assert check_in == CheckIns.get_check_in!(check_in.id)
    end

    test "delete_check_in/1 deletes the check_in" do
      check_in = check_in_fixture()
      assert {:ok, %CheckIn{}} = CheckIns.delete_check_in(check_in)
      assert_raise Ecto.NoResultsError, fn -> CheckIns.get_check_in!(check_in.id) end
    end

    test "change_check_in/1 returns a check_in changeset" do
      check_in = check_in_fixture()
      assert %Ecto.Changeset{} = CheckIns.change_check_in(check_in)
    end
  end
end
