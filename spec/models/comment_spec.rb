# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  user_id          :integer
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:user) }
  it { should belong_to(:commentable) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:commentable_id) }
  it { is_expected.to validate_presence_of(:commentable_type) }
  it { is_expected.to validate_presence_of(:body) }
end
