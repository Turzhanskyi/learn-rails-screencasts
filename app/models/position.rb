# frozen_string_literal: true

# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#  item_id    :integer
#
class Position < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :item_id, :cart_id, :quantity, presence: true
end
