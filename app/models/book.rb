class Book < ActiveRecord::Base
#  attr_accessor :name, :email

  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
#  validates :email, :presence => true, :format => /@/

end
