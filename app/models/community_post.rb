class CommunityPost < ApplicationRecord
  belongs_to :user
  enum post_type: { gallery: 0, question: 1 }, _default: :gallery
  enum status: { visible: 0, hidden: 1, deleted: 2 }, _default: :visible

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  mount_uploaders :media, MediaUploader 
  serialize :media, JSON
end