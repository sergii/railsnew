class Template < ApplicationRecord
  has_many :generator_options
  has_many :applications

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
