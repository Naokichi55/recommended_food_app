# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end
