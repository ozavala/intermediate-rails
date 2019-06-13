# == Schema Information
#
# Table name: shouts
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content_type :string
#  content_id   :integer
#

class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
