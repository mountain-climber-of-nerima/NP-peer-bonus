class User < ActiveRecord::Base
  validates :password, {presence: true}
  validates :email, {presence: true, uniqueness: true}
end
