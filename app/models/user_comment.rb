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

class UserComment < ActiveRecord::Base
  validates :author_id, :user_id, :body, presence: true

  belongs_to(
    :author,
    class_name: :User
  )

  belongs_to :user


end
