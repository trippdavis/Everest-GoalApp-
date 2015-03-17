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
    description "Default Goal Description"
    status "incomplete"
    shared_status "public"
  end
end
