require "test_helper"

class GeneratorOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generator_option = generator_options(:one)
  end

  test "should get index" do
    get generator_options_url
    assert_response :success
  end

  test "should get new" do
    get new_generator_option_url
    assert_response :success
  end

  test "should create generator_option" do
    assert_difference("GeneratorOption.count") do
      post generator_options_url, params: { generator_option: { name: @generator_option.name, options: @generator_option.options, slug: @generator_option.slug, template_id: @generator_option.template_id } }
    end

    assert_redirected_to generator_option_url(GeneratorOption.last)
  end

  test "should show generator_option" do
    get generator_option_url(@generator_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_generator_option_url(@generator_option)
    assert_response :success
  end

  test "should update generator_option" do
    patch generator_option_url(@generator_option), params: { generator_option: { name: @generator_option.name, options: @generator_option.options, slug: @generator_option.slug, template_id: @generator_option.template_id } }
    assert_redirected_to generator_option_url(@generator_option)
  end

  test "should destroy generator_option" do
    assert_difference("GeneratorOption.count", -1) do
      delete generator_option_url(@generator_option)
    end

    assert_redirected_to generator_options_url
  end
end
