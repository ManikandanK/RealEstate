class Property < ActiveRecord::Base
  resourcify
  belongs_to :user

  validates_presence_of :name,:map_position

end
