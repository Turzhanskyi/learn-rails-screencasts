# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items

  validates :user_id, :user, presence: true

  def calculate_total
    write_attribute :total, items.map(&:price).inject(:+)
  end
end
