class Sensor < ActiveRecord::Base
  has_many :measures

  KINDS = [ ['Digital', 0], ['Analog', 1] ]
end
