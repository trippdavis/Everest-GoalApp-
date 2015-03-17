# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  body       :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_comment do
    author_id 1
body "MyText"
user_id 1
  end

end
