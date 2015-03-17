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

class GoalComment < ActiveRecord::Base

  validates :author_id, :body, :goal_id, presence: true

  belongs_to(
    :author,
    class_name: :User
  )

  belongs_to :goal

end
