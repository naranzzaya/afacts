class Meetup < ApplicationRecord
  enum status: { upcoming: 0, live: 1, past: 2 }, _default: :upcoming
  validates :title, :starts_at, presence: true
end