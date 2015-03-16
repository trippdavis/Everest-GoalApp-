# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  description   :text             not null
#  status        :string           not null
#  shared_status :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :goal do
    user_id 1
description "MyText"
status "MyString"
shared_status "MyString"
  end

end
