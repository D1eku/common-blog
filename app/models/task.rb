class Task < ApplicationRecord
  validates :is_done, presence: true
  validates :title, presence: true
  validates :description, presence: true

  def is_done?
    is_done
  end
end
