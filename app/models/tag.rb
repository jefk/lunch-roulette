class Tag < ActiveRecord::Base
  validates :name, unique: true
end
