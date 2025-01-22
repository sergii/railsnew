require "test_helper"

class TemplateTest < ActiveSupport::TestCase
  test "destroying template nullifies generator_option template_id" do
    template = templates(:minimal_template) # Assuming you have a fixture for templates
    generator_option = generator_options(:generator_options_minimal) # Assuming you have a fixture for generator_options

    assert_equal template.id, generator_option.template_id # Ensure the association exists
    template.destroy!
    assert_nil generator_option.reload.template_id
  end
end
