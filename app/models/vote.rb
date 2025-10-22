class Vote < ApplicationRecord
  belongs_to :community_post
  belongs_to :user
  validates :user_id, uniqueness: { scope: :community_post_id }
  validates :value, inclusion: { in: [-1, 1] }
end