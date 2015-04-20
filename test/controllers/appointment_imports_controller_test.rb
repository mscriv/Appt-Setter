require 'test_helper'

class AppointmentImportsControllerTest < ActionController::TestCase
  setup do
    @appointment_import = appointment_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointment_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment_import" do
    assert_difference('AppointmentImport.count') do
      post :create, appointment_import: { comments: @appointment_import.comments, end_date: @appointment_import.end_date, end_time: @appointment_import.end_time, first_name: @appointment_import.first_name, last_name: @appointment_import.last_name, start_date: @appointment_import.start_date, start_time: @appointment_import.start_time }
    end

    assert_redirected_to appointment_import_path(assigns(:appointment_import))
  end

  test "should show appointment_import" do
    get :show, id: @appointment_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment_import
    assert_response :success
  end

  test "should update appointment_import" do
    patch :update, id: @appointment_import, appointment_import: { comments: @appointment_import.comments, end_date: @appointment_import.end_date, end_time: @appointment_import.end_time, first_name: @appointment_import.first_name, last_name: @appointment_import.last_name, start_date: @appointment_import.start_date, start_time: @appointment_import.start_time }
    assert_redirected_to appointment_import_path(assigns(:appointment_import))
  end

  test "should destroy appointment_import" do
    assert_difference('AppointmentImport.count', -1) do
      delete :destroy, id: @appointment_import
    end

    assert_redirected_to appointment_imports_path
  end
end
