# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 200, { gravity: :center }]
  end

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :name, presence: true
  validates :avatar, content_type: ["image/png", "image/jpeg", "image/gif"]

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
