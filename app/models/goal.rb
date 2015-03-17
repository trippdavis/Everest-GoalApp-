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

class Goal < ActiveRecord::Base
  STATUS = %w(incomplete complete)
  SHARED_STATUS = %w(public private)

  validates :user_id, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
  validates :shared_status, presence: true, inclusion: { in: SHARED_STATUS }


  has_many :comments, as: :commentable
  belongs_to :user
end
