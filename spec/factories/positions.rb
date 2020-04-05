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
FactoryBot.define do
  factory :position do
  end
end
