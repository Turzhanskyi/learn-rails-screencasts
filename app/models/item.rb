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
class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, :image, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
end
