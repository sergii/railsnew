class Application < ApplicationRecord
  belongs_to :generator_option
  belongs_to :template

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :rails_version, presence: true # add validates with def rails_version...

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= "draft"
  end
end
