# frozen_string_literal: true

# this is post model
class Post < ApplicationRecord
  validates :title, presence: true
end
