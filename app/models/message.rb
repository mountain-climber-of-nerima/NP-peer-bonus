class Message < ActiveRecord::Base
  validates :receive_id, {presence: true}
  validates :message_content, {presence: true}
end
