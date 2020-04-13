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
require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:user) }

  it 'calculates the total price of the order' do
    item1 = Item.new(price: 10)
    item2 = Item.new(price: 20)

    order = Order.new
    order.items << item1
    order.items << item2

    order.calculate_total
    expect(order.total) == 30
  end
end
