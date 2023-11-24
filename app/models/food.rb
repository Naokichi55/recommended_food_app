# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 200, gravity: :center]
  end
  
  validates :name, presence: true
  validates :avatar, content_type: ["image/png", "image/jpeg", "image/gif"]
end
