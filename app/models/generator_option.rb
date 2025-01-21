class GeneratorOption < ApplicationRecord
  belongs_to :template
  has_many :applications

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :options, presence: true

  # Optional: Generate a slug automatically
  before_validation :set_slug, on: :create

  private

  def set_slug
    self.slug ||= name.parameterize if name.present?
  end
end

# class GeneratorOption < ApplicationRecord
#   # Validate presence of name and options
#   validates :name, presence: true
#   validates :options, presence: true

#   # Validate specific keys inside the options JSONB
#   validate :validate_options

#   def validate_options
#     allowed_keys = %w[
#       database skip_git skip_javascript javascript css api_mode minimal
#       rails_version force pretend quiet
#     ]
#     options.each_key do |key|
#       errors.add(:options, "Invalid option key: #{key}") unless allowed_keys.include?(key)
#     end
#   end

#   # Convert options hash to CLI arguments
#   def to_command
#     args = options.map do |key, value|
#       if value.is_a?(TrueClass) || value.is_a?(FalseClass)
#         value ? "--#{key.tr('_', '-')}" : nil
#       else
#         "--#{key.tr('_', '-')}=#{value}"
#       end
#     end.compact

#     "rails new #{name} #{args.join(' ')}"
#   end
# end
