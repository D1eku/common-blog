class Task < ApplicationRecord
  validates :is_done,numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true

  def is_done?
    is_done
  end
end
