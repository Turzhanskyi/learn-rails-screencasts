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
require 'rails_helper'

RSpec.describe Position, type: :model do
  it { is_expected.to belong_to(:item) }
  it { is_expected.to belong_to(:cart) }

  it { is_expected.to validate_presence_of(:item_id) }
  it { is_expected.to validate_presence_of(:cart_id) }
  it { is_expected.to validate_presence_of(:quantity) }
end
