# == Schema Information
#
# Table name: rooms
#
#  id           :bigint           not null, primary key
#  address      :string(255)      not null
#  introduction :string(255)      not null
#  name         :string(255)      not null
#  price        :integer          not null
#  room_image   :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_rooms_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :room_image, RoomImageUploader

  validates :name, presence: true
  validates :address, presence: true
  validates :introduction, presence: true,length: { maximum: 140 }
  validates :price, presence: true
  validates :room_image, presence: true

  def self.search(search)
    if search
      Room.where(['address LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end

  def self.keyword_search(keyword)
    if keyword
      Room.where(['introduction LIKE ?', "%#{keyword}%"])
    else
      Room.all
    end
  end


end
