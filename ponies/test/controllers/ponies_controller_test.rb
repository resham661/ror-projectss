require "test_helper"

class PoniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pony = ponies(:one)
  end

  test "should get index" do
    get ponies_url
    assert_response :success
  end

  test "should get new" do
    get new_pony_url
    assert_response :success
  end

  test "should create pony" do
    assert_difference("Pony.count") do
      post ponies_url, params: { pony: { name: @pony.name, profesion: @pony.profesion } }
    end

    assert_redirected_to pony_url(Pony.last)
  end

  test "should show pony" do
    # Reuse the @pony instance variable from setup
    get pony_url(@pony)
    assert_response :success
  end

  test "should get edit" do
    get edit_pony_url(@pony)
    assert_response :success
  end

  test "should update pony" do
    patch pony_url(@pony), params: { pony: { name: "updated" } }
    assert_redirected_to pony_url(@pony)

    @pony.reload
    assert_equal 'updated', @pony.name
  end

  test "should destroy pony" do
    assert_difference("Pony.count", -1) do
      delete pony_url(@pony)
    end

    assert_redirected_to ponies_url
  end
end
