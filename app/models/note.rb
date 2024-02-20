class Note < ApplicationRecord
  belongs_to :user

  attr_encrypted :title, key: ENV['G1W2SK']
  attr_encrypted :body, key: ENV['G1W2SK']
end
