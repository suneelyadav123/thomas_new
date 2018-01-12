class Bag < ApplicationRecord
  
  validates_uniqueness_of :number
  
  has_many :orders
  belongs_to :schedule
  belongs_to :vehicle
  belongs_to :user

end
