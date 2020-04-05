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
require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
