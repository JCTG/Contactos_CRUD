require 'test_helper'

class LibretaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @libretum = libreta(:one)
  end

  test "should get index" do
    get libreta_url
    assert_response :success
  end

  test "should get new" do
    get new_libretum_url
    assert_response :success
  end

  test "should create libretum" do
    assert_difference('Libretum.count') do
      post libreta_url, params: { libretum: { nombre: @libretum.nombre, tlf: @libretum.tlf } }
    end

    assert_redirected_to libretum_url(Libretum.last)
  end

  test "should show libretum" do
    get libretum_url(@libretum)
    assert_response :success
  end

  test "should get edit" do
    get edit_libretum_url(@libretum)
    assert_response :success
  end

  test "should update libretum" do
    patch libretum_url(@libretum), params: { libretum: { nombre: @libretum.nombre, tlf: @libretum.tlf } }
    assert_redirected_to libretum_url(@libretum)
  end

  test "should destroy libretum" do
    assert_difference('Libretum.count', -1) do
      delete libretum_url(@libretum)
    end

    assert_redirected_to libreta_url
  end
 
end
