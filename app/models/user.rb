# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  image_name      :string(255)
#  introduction    :text(65535)
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
has_secure_password
mount_uploader :image_name, ImageNameUploader

validates :name, presence: true
validates :image_name, presence: true
validates :email, presence: true, uniqueness: { case_sensitive: false }
validates :introduction, presence: true, length: { maximum: 140 }
validates :password, presence: true, length: { minimum: 6 },on: :create
validates :password_confirmation,presence: true,on: :create

end
