class Task < ApplicationRecord
  belongs_to :tasks_list
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  def is_done?
    is_done
  end
end
