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
FactoryBot.define do
  factory :item do
  end
end
