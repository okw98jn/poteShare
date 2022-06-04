class User < ApplicationRecord
has_secure_password
mount_uploader :image_name, ImageNameUploader

validates :name, presence: true
validates :email, presence: true, uniqueness: { case_sensitive: false }
validates :password, presence: true, length: { minimum: 6 },on: :create
validates :password_confirmation,presence: true,on: :create

end
