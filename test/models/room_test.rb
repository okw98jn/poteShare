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
require "test_helper"

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
