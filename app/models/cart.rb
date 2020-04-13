# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Cart < ApplicationRecord
  belongs_to :user
  has_many :positions
  has_many :items, through: :positions

  validates :user_id, presence: true
end
