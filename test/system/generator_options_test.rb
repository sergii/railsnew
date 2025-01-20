require "application_system_test_case"

class GeneratorOptionsTest < ApplicationSystemTestCase
  setup do
    @generator_option = generator_options(:one)
  end

  test "visiting the index" do
    visit generator_options_url
    assert_selector "h1", text: "Generator options"
  end

  test "should create generator option" do
    visit generator_options_url
    click_on "New generator option"

    fill_in "Name", with: @generator_option.name
    fill_in "Options", with: @generator_option.options
    fill_in "Slug", with: @generator_option.slug
    fill_in "Template", with: @generator_option.template_id
    click_on "Create Generator option"

    assert_text "Generator option was successfully created"
    click_on "Back"
  end

  test "should update Generator option" do
    visit generator_option_url(@generator_option)
    click_on "Edit this generator option", match: :first

    fill_in "Name", with: @generator_option.name
    fill_in "Options", with: @generator_option.options
    fill_in "Slug", with: @generator_option.slug
    fill_in "Template", with: @generator_option.template_id
    click_on "Update Generator option"

    assert_text "Generator option was successfully updated"
    click_on "Back"
  end

  test "should destroy Generator option" do
    visit generator_option_url(@generator_option)
    click_on "Destroy this generator option", match: :first

    assert_text "Generator option was successfully destroyed"
  end
end
