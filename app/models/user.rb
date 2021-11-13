class User < ApplicationRecord
  has_secure_password
  has_many :article, dependent: :destroy
  has_many :comment, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  #TODO make sure : comes just after word without any space
  validates :password, length: {minimum: 6}
end
