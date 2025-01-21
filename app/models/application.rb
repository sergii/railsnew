class Application < ApplicationRecord
  belongs_to :generator_option, optional: true
  belongs_to :template, optional: true

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :rails_version, presence: true # add validates with def rails_version...

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= "draft"
  end
end
