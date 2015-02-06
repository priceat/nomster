class Place < ActiveRecord::Base
  belongs_to :user
  validate :name, :presence => true
end
