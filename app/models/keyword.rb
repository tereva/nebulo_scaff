class Keyword < ActiveRecord::Base  

	has_many :indexations
  	# has_many :appreciations, :through => :indexations
  	has_and_belongs_to_many :appreciations
end
