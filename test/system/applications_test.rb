require "application_system_test_case"

class ApplicationsTest < ApplicationSystemTestCase
  setup do
    @application = applications(:one)
  end

  test "visiting the index" do
    visit applications_url
    assert_selector "h1", text: "Applications"
  end

  test "should create application" do
    visit applications_url
    click_on "New application"

    fill_in "Generator option", with: @application.generator_option_id
    fill_in "Rails version", with: @application.rails_version
    fill_in "Name", with: @application.name
    fill_in "Repository url", with: @application.repository_url
    fill_in "Slug", with: @application.slug
    fill_in "Description", with: @application.description
    fill_in "Status", with: @application.status
    fill_in "Template", with: @application.template_id
    click_on "Create Application"

    assert_text "Application was successfully created"
    click_on "Back"
  end

  test "should update Application" do
    visit application_url(@application)
    click_on "Edit this application", match: :first

    fill_in "Generator option", with: @application.generator_option_id
    fill_in "Name", with: @application.name
    fill_in "Rails version", with: @application.rails_version
    fill_in "Repository url", with: @application.repository_url
    fill_in "Slug", with: @application.slug
    fill_in "Description", with: @application.description
    fill_in "Status", with: @application.status
    fill_in "Template", with: @application.template_id
    click_on "Update Application"

    assert_text "Application was successfully updated"
    click_on "Back"
  end

  test "should destroy Application" do
    visit application_url(@application)
    click_on "Destroy this application", match: :first

    assert_text "Application was successfully destroyed"
  end
end
