class Template < ApplicationRecord
  has_many :generator_options, dependent: :nullify
  has_many :applications, dependent: :nullify

  # before_validation :generate_slug, if: -> { name.present? && slug.blank? }

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  # validates :slug, uniqueness: { case_sensitive: false }
  # validates :slug, format: { with: /\A[a-z0-9-]+\z/, message: "only allows lowercase letters, numbers, and hyphens" }

  # private

  # def generate_slug
  #   self.slug = name.parameterize
  # end
end
