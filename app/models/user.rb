class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, length: { in: 4..12 }
  validates :password, length: { in: 6..15 }
  validates :password_confirmation, length: { in: 6..15 }
end
