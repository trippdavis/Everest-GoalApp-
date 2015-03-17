# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text             not null
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  author_id        :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :body, :commentable_id, :commentable_type, :author_id, presence: true

  belongs_to(
    :author,
    class_name: :User
  )

  belongs_to :commentable, polymorphic: true
end
