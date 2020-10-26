class Record < ApplicationRecord
  belongs_to :user, optional: true
  validates :kilos, presence: true
  validates :reps, presence: true
end
