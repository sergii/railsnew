require "test_helper"

class TemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @template = templates(:minimal_template)
    @valid_template_params = {
      name: "Unique Template Name",
      description: "This is a valid description",
      path: "path/to/template",
      slug: "unique_template_slug"
    }
  end

  test "should get index" do
    get templates_url
    assert_response :success
  end

  test "should get new" do
    get new_template_url
    assert_response :success
  end

  test "should create template" do
    assert_difference("Template.count") do
      post templates_url, params: { template: @valid_template_params }
    end

    assert_redirected_to template_url(Template.last)
    follow_redirect!
    assert_match "Template was successfully created.", response.body
  end

  test "should show template" do
    get template_url(@template)
    assert_response :success
  end

  test "should get edit" do
    get edit_template_url(@template)
    assert_response :success
  end

  test "should update template" do
    patch template_url(@template), params: { template: { description: @template.description, name: @template.name, path: @template.path, slug: @template.slug } }
    assert_redirected_to template_url(@template)
  end

  test "should destroy template" do
    assert_difference("Template.count", -1) do
      delete template_url(@template)
    end

    assert_redirected_to templates_url
  end
end
