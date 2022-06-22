# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  end_date   :datetime         not null
#  number     :integer
#  start_date :datetime         not null
#  sum_price  :integer
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

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number, presence: true
  validate :date_before_start
  validate :date_before_end
  validate :same_date
  require "date"

  #開始日のバリデーション
  def date_before_start
    if start_date == nil
      return
    elsif start_date < Date.today
      errors.add(:start_date, "は今日以降のものを選択してください")
    end
  end

  #終了日のバリデーション
  def date_before_end
    if end_date == nil
      return
    elsif end_date < Date.today
      errors.add(:end_date, "は今日以降のものを選択してください")
    elsif start_date > end_date
      errors.add(:end_date, "は開始日以降のものを選択してください")
    end
  end
  
  #開始日と終了日が同じ日のバリデーション
  def same_date
    if start_date == nil || end_date == nil
      return
    elsif start_date == end_date
      errors.add(:start_date,"と終了日を同じ日にしないで下さい")
    end
  end
end
