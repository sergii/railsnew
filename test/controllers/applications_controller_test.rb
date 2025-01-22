require "test_helper"

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @application = applications(:rails_8_0_0_api_app)
    @valid_application_params = {
      generator_option_id: @application.generator_option_id,
      rails_version: @application.rails_version,
      name: "Rails minimal application",
      description: "Rails application with --minimal flag option",
      repository_url: "https://github.com/username/reponame",
      slug: "rails_minimal_application",
      status: "active",
      template_id: @application.template_id
    }
  end

  test "should get index" do
    get applications_url
    assert_response :success
  end

  test "should get new" do
    get new_application_url
    assert_response :success
  end

  test "should create application" do
    assert_difference("Application.count") do
      post applications_url, params: { application: @valid_application_params }
    end

    assert_redirected_to application_url(Application.last)
  end

  test "should show application" do
    get application_url(@application)
    assert_response :success
  end

  test "should get edit" do
    get edit_application_url(@application)
    assert_response :success
  end

  test "should update application" do
    patch application_url(@application), params: { application: { generator_option_id: @application.generator_option_id, rails_version: @application.rails_version, name: @application.name, description: @application.description, repository_url: @application.repository_url, slug: @application.slug, status: @application.status, template_id: @application.template_id } }
    assert_redirected_to application_url(@application)
  end

  test "should destroy application" do
    assert_difference("Application.count", -1) do
      delete application_url(@application)
    end

    assert_redirected_to applications_url
  end
end
