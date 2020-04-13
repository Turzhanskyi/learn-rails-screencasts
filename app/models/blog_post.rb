# frozen_string_literal: true

# == Schema Information
#
# Table name: blog_posts
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BlogPost < ApplicationRecord
  has_many :comments, as: :commentable

  validates :body, :title, presence: true
end
