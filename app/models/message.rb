class Message < ActiveRecord::Base
  validates :receive_id, {presence: true}
end
