class SecureRecord < ApplicationRecord
  belongs_to :user
  audited
  attr_encrypted :title, key: ENV['G1W2SK']
  attr_encrypted :login, key: ENV['G1W2SK']
  attr_encrypted :password, key: ENV['G1W2SK']
  attr_encrypted :description, key: ENV['G1W2SK']
end
