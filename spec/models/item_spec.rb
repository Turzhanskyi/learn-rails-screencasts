# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :string
#  image       :string
#  name        :string
#  price       :float
#  real        :boolean
#  votes_count :integer          default(0)
#  weight      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_items_on_name   (name)
#  index_items_on_price  (price)
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to have_many(:positions) }
  it { is_expected.to have_many(:carts).through(:positions) }
  it { is_expected.to have_many(:comments) }

  it {
    should validate_numericality_of(:price)
      .is_greater_than(0).allow_nil
  }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:weight) }
  it { is_expected.to validate_presence_of(:image) }
end
