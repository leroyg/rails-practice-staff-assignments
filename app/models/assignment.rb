class Assignment < ActiveRecord::Base
  belongs_to :location

  validates_presence_of :role, :location

end