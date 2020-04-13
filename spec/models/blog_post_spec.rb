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
  it { is_expected.to have_many(:comments) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:title) }
end
