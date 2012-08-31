class Category < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :profiles

  validates_presence_of :name
end
