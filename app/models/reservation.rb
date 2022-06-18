# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  end_date   :datetime         not null
#  number     :integer          not null
#  start_date :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reservations_on_room_id  (room_id)
#  index_reservations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
