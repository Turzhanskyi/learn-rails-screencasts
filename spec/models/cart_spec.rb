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
require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:positions) }
  it { is_expected.to have_many(:items).through(:positions) }

  it { is_expected.to validate_presence_of(:user_id) }
end
