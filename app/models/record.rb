class Record < ApplicationRecord
  belongs_to :user, optional: true
  validates :kilos, presence: true, inclusion: { in: 1..100 }
  validates :reps, presence: true, inclusion: { in: 1..100 }
end
