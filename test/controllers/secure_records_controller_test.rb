require "test_helper"

class SecureRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get secure_records_index_url
    assert_response :success
  end

  test "should get show" do
    get secure_records_show_url
    assert_response :success
  end

  test "should get new" do
    get secure_records_new_url
    assert_response :success
  end

  test "should get save" do
    get secure_records_save_url
    assert_response :success
  end

  test "should get edit" do
    get secure_records_edit_url
    assert_response :success
  end

  test "should get update" do
    get secure_records_update_url
    assert_response :success
  end

  test "should get destroy" do
    get secure_records_destroy_url
    assert_response :success
  end
end
