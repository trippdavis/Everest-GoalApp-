# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  body       :text             not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :goal_comment do
    author_id 1
body "MyText"
comment_id 1
  end

end
