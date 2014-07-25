class Assignment < ActiveRecord::Base
  belongs_to :location

  validates_presence_of :role, :location

  validates_uniqueness_of :role, scope: :location
end