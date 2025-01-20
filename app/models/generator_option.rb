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
